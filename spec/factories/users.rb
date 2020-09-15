FactoryBot.define do
  factory :user do
    nickname              {"furima太郎"}
    email                 {"furima29365@gmail.com"}
    password              {"furima29365"}
    password_confirmation {password}
    first_name            {"山田"}
    last_name             {"陸太郎"}
    first_name_kana       {"ヤマダ"}
    last_name_kana        {"リクタロウ"}
    birth_date            {"2000-1-1"}
  end
end