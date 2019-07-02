FactoryBot.define do
  factory :menu_item do
    date { Date.today }
    price { 15.2 }
    kind { 'main_dish' }

    sequence(:image_url) { |n| "/photo/#{n}" }
    sequence(:name) { |n| "main_dish#{n}" }

    factory :soup do
      kind { 'soup' }
      sequence(:name) { |n| "soup#{n}" }
    end

    factory :drink do
      kind { 'drink' }
      sequence(:name) { |n| "drink#{n}" }
    end
  end
end
