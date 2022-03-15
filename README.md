# テーブル設計

## usersテーブル

| Column         | Type   | Options     |
| -------------- | -------| ----------- |
| nickname       | string | null: false |
| email          | string | null: false |
| password       | string | null: false |
| last_name      | string | null: false |
| first_name     | string | null: false |
| lastname_kana  | string | null: false |
| firstname_kana | string | null: false |
| birthday       | date   | null: false |

## Association
-has_many :items
-has_many :comments
-has_many :orders

## itemsテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| image        | string     | null: false                    |
| item_name    | string     | null: false                    |
| explanation  | text       | null: false                    |
| category     | integer    | null: false                    |
| status       | integer    | null: false                    |
| delivery     | integer    | null: false                    |
| area         | integer    | null: false                    |
| days         | integer    | null: false                    |
| price        | integer    | null: false                    |
| user_id      | references | null: false, foreign_key: true |

## Association
-has_many :comments
-has_one :order
-belongs_to :user

## commentsテーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| message  | string     | null: false                    |
| user_id  | references | null: false, foreign_key: true |
| item_id  | references | null: false, foreign_key: true |

## Association
-belongs_to :user
-belongs_to :item

## ordersテーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user_id  | references | null: false, foreign_key: true |
| item_id  | references | null: false, foreign_key: true |

## Association
-belongs_to :user
-belongs_to :item
-has_one :mailing

## mailingsテーブル

| Column         | Type          | Options                        |
| -------------- | ------------- | ------------------------------ |
| address_number | string        | null: false                    |
| todofuken      | integer       | null: false                    |
| sichoson       | string        | null: false                    |
| banchi         | string        | null: false                    |
| building       | string        |                                |
| phone_number   | string        | null: false                    |
| order_user     | references    | null: false, foreign_key: true |

## Association
-belongs_to :order