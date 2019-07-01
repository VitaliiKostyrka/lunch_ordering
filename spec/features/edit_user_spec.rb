require 'rails_helper'

RSpec.feature 'Edit User', type: :feature, js: true do
  let!(:user) { FactoryBot.create(:user) }

  it 'success edit user' do
    sign_in user
    new_email = 'new@email.com'

    visit edit_user_path(user)
    expect(find('input#user_email').value).to eq(user.email)
    expect(find('input#user_name').value).to eq(user.name)
    expect(page).to have_content('Edit User')

    fill_in 'Email', with: new_email
    click_button 'Save User'

    expect(page).to have_content('Dashboard')
    expect(page).to have_content('Your profile updated')
    visit edit_user_path(user)
    expect(find('input#user_email').value).to eq(new_email)
  end

  it 'failed edit user' do
    sign_in(user)

    visit edit_user_path(user)
    expect(find('input#user_email').value).to eq(user.email)
    expect(find('input#user_name').value).to eq(user.name)
    expect(page).to have_content('Edit User')

    fill_in 'Email', with: ''
    click_button 'Save User'

    expect(page).to_not have_content('Dashboard')
    expect(page).to_not have_content('Your profile updated')
  end
end
