require 'rails_helper'

RSpec.describe MenuItem, type: :model do
  let(:menu_item) { FactoryBot.build(:menu_item) }
  let(:menu_item_without_name) { FactoryBot.build(:menu_item, name: '') }

  it 'valid menu item' do
    expect(menu_item).to be_valid
  end

  it 'not valid menu item' do
    expect(menu_item_without_name).to_not be_valid
  end
end
