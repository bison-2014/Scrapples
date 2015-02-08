require 'rails_helper'

feature 'users can join games' do
  before :each do
    User.create!(name: "Miriam", email: "miriam2@me.com", password: "password", password_confirmation: "password")
  end

  scenario 'shows users list of open games' do
    visit '/login'
    fill_in 'Email', with: 'miriam2@me.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    visit games_path
    expect(page).to have_content("Open Games")
  end

  scenario 'shows users list of games they have been invited to' do
    visit '/login'
    fill_in 'Email', with: 'miriam2@me.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    visit games_path
    expect(page).to have_content("Pending Invitations")
  end

end


