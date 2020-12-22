# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birthday        | date   | null: false |

### Association

- has_many :items
- has_many :buys


## items テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| name               | string     | null: false |
| infomation         | text       | null: false |
| category_id        | integer    | null: false |
| status_id          | integer    | null: false |
| payer_id           | integer    | null: false |
| prefecture_id      | integer    | null: false |
| day_to_delivery_id | integer    | null: false |
| price              | integer    | null: false |
| user_id            | references |             |

### Association

- belongs_to :user
- has_one :buy
- has_one :address


## buys テーブル

| Column  | Type       | Option            |
| ------- | ---------- | ----------------- |
| user_id | references | foreign_key: true |
| item_id | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address


## addresses テーブル

| Column          | Type       | Option      |
| --------------- | ---------- | ----------- |
| postal_code     | string     | null: false |
| prefecture_id   | integer    | null: false |
| city            | string     | null: false |
| address         | string     | null: false |
| building        | string     |             |
| phone_number    | string     | null: false | 
| buy_id          | references | foreign_key: true |

### Association

- belongs_to :item
- belongs_to :buy