FactoryBot.define do
  factory :item do
    name               { 'サンプル商品' } # 修正：title → name
    description        { 'これはテスト用の説明です' } # 修正：text → description
    category_id        { 2 }
    status_id          { 2 }
    shipping_fee_id    { 2 }
    prefecture_id      { 2 }
    shipping_day_id    { 2 }
    price              { 1000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/sample.png'), filename: 'sample.png')
    end
  end
end
