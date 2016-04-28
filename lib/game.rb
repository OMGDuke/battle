class Game
  attr_reader :player_1, :player_2, :current_player, :defensive_player

  def initialize player_1, player_2
    @player_1 = player_1
    @player_2 = player_2
    @current_player = @player_1
    @defensive_player = @player_2
  end

  def whallop player
    player.been_hit
  end

  def switch_player
    @current_player = switch current_player
    @defensive_player = switch defensive_player
  end

  def over?
    player_2.hp <= 0
  end

  private

  def switch player_type
    (player_type == player_1 ? player_2 : player_1)
  end

end
