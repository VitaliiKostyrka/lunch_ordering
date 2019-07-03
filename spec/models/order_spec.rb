require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:order) { FactoryBot.build(:order) }
  let(:order_without_user) { FactoryBot.build(:order, user: nil) }

  it 'valid order' do
    expect(order).to be_valid
  end

  it 'not valid order' do
    expect(order_without_user).to_not be_valid
  end
end
