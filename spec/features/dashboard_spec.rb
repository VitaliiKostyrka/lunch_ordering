require 'rails_helper'

RSpec.feature 'Dashboard', type: :feature, js: true do
  let!(:user) { FactoryBot.create(:user) }

  it 'open dashboard' do
    sign_in_as(user)
    expect(page).to have_content('Dashboard')
  end
end
