# テーブル設計

## usersテーブル

| Column             | Type   | Options                  |
| ------------------ | -------| ------------------------ |
| nickname           | string | null: false              |
| email              | string | null: false, unique:true |
| encrypted_password | string | null: false              |
| last_name          | string | null: false              |
| first_name         | string | null: false              |
| lastname_kana      | string | null: false              |
| firstname_kana     | string | null: false              |
| birthday           | date   | null: false              |

## Association
-has_many :items
-has_many :comments
-has_many :orders

## itemsテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| item_name       | string     | null: false                    |
| explanation     | text       | null: false                    |
| category_id     | integer    | null: false                    |
| status_id       | integer    | null: false                    |
| delivery_id     | integer    | null: false                    |
| area_id         | integer    | null: false                    |
| shipping_day_id | integer    | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

## Association
-has_many :comments
-has_one :order
-belongs_to :user

## commentsテーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| message  | string     | null: false                    |
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |

## Association
-belongs_to :user
-belongs_to :item

## ordersテーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |

## Association
-belongs_to :user
-belongs_to :item
-has_one :mailing

## mailingsテーブル

| Column         | Type          | Options                        |
| -------------- | ------------- | ------------------------------ |
| address_number | string        | null: false                    |
| area_id        | integer       | null: false                    |
| sichoson       | string        | null: false                    |
| banchi         | string        | null: false                    |
| building       | string        |                                |
| phone_number   | string        | null: false                    |
| order          | references    | null: false, foreign_key: true |

## Association
-belongs_to :order