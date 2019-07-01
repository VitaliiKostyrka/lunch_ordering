FactoryBot.define do
  factory :menu_item do
    date { Date.today }
    association :course, factory: course
  end
end
