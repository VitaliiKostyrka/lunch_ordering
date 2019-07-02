require 'rails_helper'

RSpec.feature 'Make order', type: :feature, js: true do
  let(:user) { FactoryBot.create(:user) }
  let(:soup) { FactoryBot.create(:soup) }
  let(:drink) { FactoryBot.create(:drink) }
  let!(:menu_item_drink) { FactoryBot.create(:menu_item, course: drink) }
  let!(:menu_item_soup) { FactoryBot.create(:menu_item, course: soup) }
  let!(:menu_item_main_dish) { FactoryBot.create(:menu_item) }

  it 'make order with 3 items' do
    sign_in user
    find("#menu_item#{soup.id}").click
    find("#menu_item#{drink.id}").click
    find("#menu_item#{menu_item_main_dish.course.id}").click

    find('#submit').click
    expect(page).to have_content("total price: #{soup.price + drink.price + menu_item_main_dish.course.price}")
  end

  it 'make order with 1 items' do
    sign_in user
    find("#menu_item#{soup.id}").click

    find('#submit').click
    expect(page).to have_content("total price: #{soup.price}")
  end
end
