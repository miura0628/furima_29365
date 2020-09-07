# テーブル設計

## users テーブル

|  Column          |  Type     |  Options      |
|  --------------  |  ------   |  -----------  |
|  nickname        |  string   |  null: false  |
|  mail            |  string   |  null: false  |
|  password        |  string   |  null: false  |
|  name_kanji      |  string   |  null: false  |
|  name_katakana   |  string   |  null: false  |
|  birthday        |  integer  |  null: false  |

### Association

- has_many :items
- has_many :orders

## items テーブル

|  Column               |  Type        |  Options                         |
|  -------------------  |  ----------  |  ------------------------------  |
|  product_name         |  string      |  null: false                     |
|  product_description  |  string      |  null: false                     |
|  photo                |  text        |  null: false                     |
|  payment_amount       |  integer     |  null: false                     |
|  postage              |  integer     |  null: false                     |
|  category             |  string      |  null: false                     |
|  status               |  string      |  null: false                     |
|  shipping_charges     |  string      |  null: false                     |
|  destination_area     |  string      |  null: false                     |
|  days_until_shipping  |  string      |  null: false                     |
|  selling_price        |  integer     |  null: false                     |
|  fee                  |  integer     |  null: false                     |
|  sales_profit         |  integer     |  null: false                     |
|  user_id              |  references  |  null: false, foreign_key: true  |

### Association

- belongs_to :user

## orders テーブル

|  Column               |  Type        |  Options                         |
|  -------------------  |  ----------  |  ------------------------------  |
|  product_name         |  string      |  null: false                     |
|  product_description  |  string      |  null: false                     |
|  photo                |  text        |  null: false                     |
|  payment_amount       |  integer     |  null: false                     |
|  postage              |  integer     |  null: false                     |
|  credit_card_numbers  |  integer     |  null: false                     |
|  expiration_date      |  string      |  null: false                     |
|  security_code        |  integer     |  null: false                     |
|  user_id              |  integer     |  null: false, foreign_key: true  |

### Association

- belongs_to :user
- has_one :address

## addresses テーブル

|  Column         |  Type        |  Options                         |
|  -------------  |  ----------  |  ------------------------------  |
|  postal_code    |  integer     |  null: false                     |
|  prefectures    |  string      |  null: false                     |
|  city           |  string      |  null: false                     |
|  address        |  string      |  null: false                     |
|  building_name  |  string      |  null: false                     |
|  phone_number   |  integer     |  null: false                     |
|  order_id       |  integer     |  null: false, foreign_key: true  |

### Association

- belongs_to :order