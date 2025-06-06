# README

users
| Column             | Type    | Options    |
| nickname           | string  | null: false|
| email              | string  | null: false,unique: true|
| encrypted_password | string  | null: false|
| family_name        | string  | null: false|
| first_name         | string  | null: false|
| family_name_kana   | string  | null: false|
| first_name_kana    | string  | null: false|
| birthday           | date    | null: false|

has_many :items
has_many :orders

items
| Column             | Type       | Options    |
| title              | string     | null: false|
| explanation        | text       | null: false|
| category_id        | integer    | null: false|
| status_id          | integer    | null: false|
| shipping_cost_id   | integer    | null: false|
| prefecture_id      | integer    | null: false|
| handing_time_id    | integer    | null: false|
| price              | integer    | null: false|
| user               | references | null: false,foreign_key: true|

belongs_to :user
has_one :order

orders
| Column  | Type       | Options   
| user    | references | null: false,foreign_key: true|
| item    | references | null: false,foreign_key: true|

belongs_to :user
belongs_to :item
has_one :shipping_address

shipping_address
| Column         | Type       | Options    |
| postal_code    | string     | null: false|
| prefecture_id  | integer    | null: false|
| city           | string     | null: false|
| street_address | string     | null: false|
| building       | string     | null: true|
| phone_number   | string     | null: false|
| order          | references | null: false,foreign_key: true|

belongs_to :order