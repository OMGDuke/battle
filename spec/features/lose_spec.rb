feature 'Able to lose the game' do

  scenario 'Player 2 HP reduced to zero' do
    sign_in_and_play
    11.times {click_button 'Attack!'}
    expect(page).to have_content 'Ross loses! Womp womp...'
  end

  scenario 'Emmett HP reduced to zero' do
    sign_in_and_play_2
    11.times {click_button 'Attack!'}
    expect(page).to have_content 'Emmett loses! Womp womp...'
  end

end