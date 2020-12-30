FactoryBot.define do
  factory :purchase_address do
    postal_code { '123-4567' }
    prefecture_id { 1 }
    city { '札幌市' }
    house_number { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { "19_012_345_678" }
    token { 'tok_abcdefghijk00000000000000000' }
    user_id { 24 }
    item_id { 13 }
  end
end
