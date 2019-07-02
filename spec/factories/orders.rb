FactoryBot.define do
  factory :Order do
    association :menu_item, factory: menu_item
    association :user, factory: user
  end
end
