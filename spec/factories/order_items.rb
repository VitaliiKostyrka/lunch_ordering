FactoryBot.define do
  factory :order_item do
    association :menu_item, factory: menu_item
    association :user, factory: user
  end
end