# require 'spec_helper'
# require 'rails_helper'
#
# feature 'user can sign up' do
#   scenario 'with valid name, email and password' do
#     visit '/signup'
#     fill_in 'Name', with: 'Raj'
#     fill_in 'Email', with: 'raj@raj.com'
#     fill_in 'Password', with: 'password'
#     fill_in 'Password confirmation', with: 'password'
#     click_button 'Create User'
#
#     # save_and_open_page
#   end
# end
#
# feature 'user can log in' do
#   scenario 'with valid email and password' do
#     User.create!(name: "Miriam", email: "miriam2@me.com", password: "password", password_confirmation: "password")
#     visit '/login'
#     fill_in 'Email', with: 'miriam2@me.com'
#     fill_in 'Password', with: 'password'
#     click_button 'Log in'
#
#     # save_and_open_page
#   end
# end

