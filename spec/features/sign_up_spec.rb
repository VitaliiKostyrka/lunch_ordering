require 'rails_helper'

RSpec.feature 'Sign up', type: :feature, js: true do
  let(:user) { FactoryBot.build(:user) }

  it 'success sign up' do
    visit new_user_registration_path
    expect(page).to have_content('Sign up')
    fill_in 'Name', with: user.name
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    fill_in 'user_password_confirmation', with: user.password
    click_button 'Sign up'
    expect(page).to have_content('Dashboard')
  end

  it 'sign up password confirm issue' do
    visit new_user_registration_path
    expect(page).to have_content('Sign up')
    fill_in 'Name', with: user.name
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    fill_in 'user_password_confirmation', with: "NotPreviousPassword"
    click_button 'Sign up'
    expect(page).to_not have_content("Dashboard")
    expect(page).to have_content("Password confirmation doesn't match Password")
  end

  it 'sign up miss name issue' do
    visit new_user_registration_path
    expect(page).to have_content('Sign up')
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    fill_in 'user_password_confirmation', with: user.password
    click_button 'Sign up'
    expect(page).to_not have_content("Dashboard")
    expect(page).to have_content("Name can't be blank")
  end
end