require 'rails_helper'

RSpec.feature 'Make order', type: :feature, js: true do
  let(:user) { FactoryBot.create(:user) }
  let!(:menu_item_drink) { FactoryBot.create(:drink) }
  let!(:menu_item_soup) { FactoryBot.create(:soup) }
  let!(:menu_item_main_dish) { FactoryBot.create(:menu_item) }

  it 'make order with 3 items' do
    sign_in user
    total_price = menu_item_soup.price + menu_item_drink.price + menu_item_main_dish.price
    find("#menu_item#{menu_item_soup.id}").click
    find("#menu_item#{menu_item_drink.id}").click
    find("#menu_item#{menu_item_main_dish.id}").click

    find('#submit').click
    expect(page).to have_content("total price: #{total_price}")
  end

  it 'make order with 1 items' do
    sign_in user
    find("#menu_item#{menu_item_soup.id}").click

    find('#submit').click
    expect(page).to have_content("total price: #{menu_item_soup.price}")
  end
end
