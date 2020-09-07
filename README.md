# テーブル設計

## users テーブル

|  Column          |  Type     |  Options      |
|  --------------  |  ------   |  -----------  |
|  nickname        |  string   |  null: false  |
|  mail            |  string   |  null: false  |
|  password        |  string   |  null: false  |
|  family_name     |  string   |  null: false  |
|  first_name      |  string   |  null: false  |
|  birthday        |  date     |  null: false  |

### Association

- has_many :items
- has_many :orders

## items テーブル

|  Column               |  Type        |  Options                         |
|  -------------------  |  ----------  |  ------------------------------  |
|  product_name         |  string      |  null: false                     |
|  product_description  |  string      |  null: false                     |
|  payment_amount       |  integer     |  null: false                     |
|  postage              |  integer     |  null: false                     |
|  category             |  integer     |  null: false                     |
|  status               |  integer     |  null: false                     |
|  shipping_charges     |  integer     |  null: false                     |
|  destination_area     |  integer     |  null: false                     |
|  days_until_shipping  |  integer     |  null: false                     |
|  selling_price        |  integer     |  null: false                     |
|  user                 |  references  |  null: false, foreign_key: true  |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

|  Column  |  Type        |  Options                         |
|  ------  |  ----------  |  ------------------------------  |
|  item    |  references  |  null: false, foreign_key: true  |

### Association

- belongs_to :user
- has_one :address

## addresses テーブル

|  Column         |  Type     |  Options                         |
|  -------------  |  -------  |  ------------------------------  |
|  postal_code    |  string   |  null: false                     |
|  prefectures    |  string   |  null: false                     |
|  city           |  string   |  null: false                     |
|  address        |  string   |  null: false                     |
|  building_name  |  string   |                                  |
|  phone_number   |  string   |  null: false                     |
|  order_id       |  integer  |  null: false, foreign_key: true  |

### Association

- belongs_to :order