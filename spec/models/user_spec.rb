require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.build(:user) }
  let(:user_without_name) { FactoryBot.build(:user, name: '') }

  it 'valid user' do
    expect(user).to be_valid
  end

  it 'not valid user' do
    expect(user_without_name).to_not be_valid
  end
end
