require 'rails_helper'

RSpec.feature 'Sign in', type: :feature, js: true do
  let(:user) { FactoryBot.create(:user) }

  it 'success sign in' do
    sign_in(user)
    expect(page).to have_content("Dashboard")
  end

  it 'bad password' do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'NotCorrectPassword'
    click_button 'Log in'
    expect(page).to have_content('Invalid Email or password.')
    expect(page).to_not have_content('Dashboard')
  end
end