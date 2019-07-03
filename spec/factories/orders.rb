FactoryBot.define do
  factory :order do
    association :menu_item, factory: :menu_item
    association :user, factory: :user
  end
end
