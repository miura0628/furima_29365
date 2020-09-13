FactoryBot.define do
  factory :user do
    nickname              {"furima太郎"}
    email                 {"furima29365@gmail.com"}
    password              {"furima29365"}
    password_confirmation {password}
    first_name            {"furima"}
    last_name             {"太郎"}
    first_name_kana       {"フリマ"}
    last_name_kana        {"タロウ"}
    birth_date            {"2000年1月1日"}
  end
end