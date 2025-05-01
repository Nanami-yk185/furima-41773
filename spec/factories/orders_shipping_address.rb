FactoryBot.define do
  factory :order_shipping_address do
    postal_code { '123-4567' }
    prefecture_id { '13' }
    city { 'Shibuya' }
    address { 'Shibuya 1-1-1' }
    building_name { 'Shibuya Building' }
    phone_number { '08012345678' }
    token { 'tok_abcdefghijk00000000000000000' }

    user_id { create(:user).id }
    item_id { create(:item).id }
  end
end
