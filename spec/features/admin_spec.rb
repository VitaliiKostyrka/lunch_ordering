require 'rails_helper'

RSpec.feature 'Admin page', type: :feature, js: true do
  let!(:admin) { FactoryBot.create(:user) }
  let!(:user) { FactoryBot.create(:user) }
  let!(:order_item) { FactoryBot.create(:order, user: user) }

  it 'have permission to admin' do
    sign_in_as admin
    visit lunch_admin_index_path
    expect(page).to have_content('Lunch Ordering')
    expect(page).to have_content(user.name)
    expect(page).to have_content(user.email)
    expect(page).to have_content(admin.email)
    expect(page).to have_content(admin.name)
    expect(page).to have_content('Create Menu Item For Today')
    expect(page).to have_content('Manage Orders')

    # show other users orders
    expect(page).to have_content("Total sum all orders #{order_item.menu_item.price}")
  end

  it 'create menu item for today' do
    sign_in_as admin
    visit lunch_admin_index_path
    fill_in 'Price', with: 23.5
    find('#menu-item-create').click
    expect(page).to have_content('Your menu item not created')

    fill_in 'Name', with: 'juice'
    fill_in 'Price', with: 23.5
    find('#menu_item_kind_drink').click
    find('#menu-item-create').click
    expect(page).to have_content('Your menu item successful created')
  end

  it 'have not permission to admin' do
    sign_in_as user
    visit lunch_admin_index_path
    expect(page).to have_content('The page you were looking for doesn\'t exist')
  end
end
