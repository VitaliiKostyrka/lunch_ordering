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
    binding.pry
  end
end
