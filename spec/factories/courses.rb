FactoryBot.define do
  factory :course do
    sequence(:image_url) { |n| "/photo/#{n}" }
    sequence(:name) { |n| "user#{n}" }
    price { 15.2 }
    kind {'main_dish'}

    factory :soup do
      kind {'soup'}
    end

    factory :drink do
      kind {'drink'}
    end
  end
end