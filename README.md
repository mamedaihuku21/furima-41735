# README

users
| nickname           | string  | null: false|
| email              | string  | null: false,unique: true|
| password           | string  | null: false|
| encrypted_password | string  | null: false|
| family_name        | string  | null: false|
| first_name         | string  | null: false|
| birthday_id        | integer | null: false|

items
| title              | string     | null: false|
| explanation        | text       | null: false|
| category_id        | integer    | null: false|
| status_id          | integer    | null: false|
| shipping_cost_id   | integer    | null: false|
| shipping_origin_id | integer    | null: false|
| handing_time_id    | integer    | null: false|
| price              | integer    | null: false|
| user               | references | null: false,foreign_key: true|

orders
| user | references | null: false,foreign_key: true|
| item | references | null: false,foreign_key: true|

shipping_address
| postal_code    | string     | null: false|
| prefecture     | integer    | null: false|
| city           | string     | null: false|
| street_address | string     | null: false|
| building       | string     | null: false|
| phone_number   | string     | null: false|
| order          | references | null: false,foreign_key: true|

