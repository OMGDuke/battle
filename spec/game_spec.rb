require 'game'

describe Game do

  let(:bob) {double :player1, name: "bob"}
  let(:ross) {double :player2, name: "ross", hp: 60}
  let(:dead_ross) {double :player2, name: "ross", hp: 0}
  subject(:game) {described_class.new bob, ross}

  it "has a player 1" do
    expect(game.player_1).to eq bob
  end

  it "has a player 2" do
    expect(game.player_2).to eq ross
  end

  describe "#whallop" do
    it "damages the other player" do
      expect(ross).to receive(:been_hit)
      game.whallop ross
    end
  end

  describe "#current_player" do
    it "first turn returns player 1" do
      expect(game.current_player).to eq bob
    end
  end

  describe "#defensive_player" do
    it "first turn returns player 2" do
      expect(game.defensive_player).to eq ross
    end
  end

  describe "#switch_player" do
    it "should flip the current and defensive player" do
      game.switch_player
      expect(game.current_player).to eq ross
      expect(game.defensive_player).to eq bob
    end
  end

  describe "#over?" do

    it "false while players have greater than zero health" do
      expect(game).not_to be_over
    end

    context "player 2 has zero health" do
      subject(:game) {described_class.new bob, dead_ross}
      it "true when player 2's HP drops to zero" do
        expect(game).to be_over
      end
    end


  end

end
