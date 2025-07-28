FactoryBot.define do
  factory :item do
    title { '商品タイトル' }
    explanation { '商品の説明' }
    category_id { 2 }
    status_id { 2 }
    shipping_cost_id { 2 }
    prefecture_id { 2 }
    handing_time_id { 2 }
    price { 1000 }

    association :user

    after(:build) do |item|
      item.image.attach(
        io: File.open(Rails.root.join('public', 'images', 'test_image.png')),
        filename: 'test_image.png',
      )
    end
  end
end




