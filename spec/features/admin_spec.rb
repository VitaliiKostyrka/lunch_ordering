require 'rails_helper'

RSpec.feature 'Admin page', type: :feature, js: true do
  let!(:admin) { FactoryBot.create(:user) }
  let!(:user) { FactoryBot.create(:user) }

  it 'have permission to admin' do
    sign_in admin
    visit lunch_admin_index_path
    expect(page).to have_content('Lunch Ordering')
  end

  it 'have not permission to admin' do
    sign_in user
    visit lunch_admin_index_path
    expect(page).to have_content('The page you were looking for doesn\'t exist')
  end
end
