# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | -----------              |
| nickname           | string | null: false              |
| email              | string | null: false,unique: true |
| encrypted_password | string | null: false              |
| last_name          | string | null: false              |
| first_name         | string | null: false              |
| last_name_kana     | string | null: false              |
| first_name_kana    | string | null: false              |
| birth_date         | date   | null: false              |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column           | Type       | Options                        |
| ------           | ------     | -----------                    |
| name             | string     | null: false, limit: 40         |
| description      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| status_id        | integer    | null: false                    |
| shipping_fee_id  | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| shipping_day_id  | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false,foreign_key: true  |

### Association

- has_one :order
- belongs_to :user

## Orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false,foreign_key: true  |
| user   | references | null: false,foreign_key: true  |

### Association

- has_one :address
- belongs_to :item
- belongs_to :user

## Addresses テーブル

| Column         | Type       | Options                        |
| -------        | ---------- | ------------------------------ |
| postal_code    |string      | null: false                    |
| prefecture_id  |integer     | null: false                    |
| city           |string      | null: false                    |
| address        |string      | null: false                    |
| building       |string      |                                |
| phone_number   |string      | null: false                    |
| order          |references  | null: false, foreign_key: true |

### Association

- belongs_to :order