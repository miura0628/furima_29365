# テーブル設計

## users テーブル

|  Column                |  Type     |  Options      |
|  --------------------  |  ------   |  -----------  |
|  nickname              |  string   |  null: false  |
|  email                 |  string   |  null: false  |
|  password              |  string   |  null: false  |
|  family_name           |  string   |  null: false  |
|  family_name_katakana  |  string   |  null: false  |
|  first_name            |  string   |  null: false  |
|  first_name_katakana   |  string   |  null: false  |
|  birthday              |  date     |  null: false  |

### Association

- has_many :items
- has_many :orders

## items テーブル

|  Column                  |  Type        |  Options                         |
|  ----------------------  |  ----------  |  ------------------------------  |
|  product_name            |  string      |  null: false                     |
|  product_description     |  text        |  null: false                     |
|  payment_amount          |  integer     |  null: false                     |
|  postage                 |  integer     |  null: false                     |
|  category_id             |  integer     |  null: false                     |
|  status_id               |  integer     |  null: false                     |
|  shipping_charges_id     |  integer     |  null: false                     |
|  destination_area_id     |  integer     |  null: false                     |
|  days_until_shipping_id  |  integer     |  null: false                     |
|  selling_price           |  integer     |  null: false                     |
|  user                    |  references  |  null: false, foreign_key: true  |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

|  Column  |  Type        |  Options                         |
|  ------  |  ----------  |  ------------------------------  |
|  item    |  references  |  null: false, foreign_key: true  |
|  user    |  references  |  null: false, foreign_key: true  |


### Association

- belongs_to :user
- has_one :address
- belongs_to :item

## addresses テーブル

|  Column          |  Type        |  Options                         |
|  --------------  |  ----------  |  ------------------------------  |
|  postal_code     |  string      |  null: false                     |
|  prefectures_id  |  integer     |  null: false                     |
|  city            |  string      |  null: false                     |
|  address         |  string      |  null: false                     |
|  building_name   |  string      |                                  |
|  phone_number    |  string      |  null: false                     |
|  order           |  references  |  null: false, foreign_key: true  |

### Association

- belongs_to :order