require 'rails_helper'

RSpec.describe Course, type: :model do
  let(:course) { FactoryBot.build(:course) }
  let(:course_without_name) { FactoryBot.build(:course, name: "") }

  it 'valid user' do
    expect(course).to be_valid
  end

  it 'not valid user' do
    expect(course_without_name).to_not be_valid
  end
end
