FactoryBot.define do
  factory :order_address do
    token          {"token"}
    postal_code    {"123-4567"}
    prefecture_id  {"2"}
    city           {"横浜市緑区"}
    address        {"青山1-1-1"}
    building_name  {"柳ビル103"}
    phone_number   {"09012345678"}
    item_id        {"1"}
    user_id        {"2"}
    item_price    {"10000"}
  end
end