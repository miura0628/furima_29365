FactoryBot.define do
  factory :item do
    item_name                    {"テスト"}
    item_info                    {"これはテストです"}
    item_category_id             {"2"}
    item_sales_status_id         {"2"}
    item_scheduled_delivery_id   {"2"}
    item_prefecture_id           {"2"}
    item_shipping_fee_status_id  {"2"}
    item_price                   {"10000"}
    user_id                      {"1"}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/darts.png'), filename: 'darts.png')
    end
  end
end