FactoryBot.define do
  factory :item do
    name                    { Faker::Company.name }
    descriptionm            { Faker::Lorem.sentence }
    category_id             { 1 }
    state_id                { 1 }
    shipping_fee_burden_id  { 1 } 
    prefecture_id           { 1 }
    shipping_day_id         { 1 }
    price                   { 500000 }
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end