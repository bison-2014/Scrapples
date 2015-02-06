require 'rails_helper'

feature 'users can join games' do
  scenario 'shows users list of open games' do
    visit games_path
    expect(page).to have_content("Open Games")
  end

  scenario 'shows users list of games theyve been invited to' do
    visit games_path
    expect(page).to have_content("Pending Invitations")
  end

  scenario 'users can join game they are invited to' do
    pending
    # as above
  end
end


