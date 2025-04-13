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
| last_name          | string | null: false              |
| first_name_kana    | string | null: false              |
| first_name_kana    | string | null: false              |
| birth_date         | date   | null: false              |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column        | Type       | Options                |
| ------        | ------     | -----------            |
| name          | string     | null: false, limit: 40 |
| discription   | text       | null: false            |
| category      | integer    | null: false            |
| status        | integer    | null: false            |
| shipping_fee  | integer    | null: false            |
| prefecture    | integer    | null: false            |
| shipping_days | integer    | null: false            |
| price         | integer    | null: false            |

### Association

- has_many :orders
- belongs_to :user

## Orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false,foreign_key: true  |

### Association

- belongs_to :item
- belongs_to :address

## Addresses テーブル

| Column      | Type       | Options                        |
| -------     | ---------- | ------------------------------ |
| postal_code |string      | null: false                    |
| prefecture  |string      | null: false                    |
| city        |string      | null: false                    |
| address     |string      | null: false                    |
| building    |string      | null: false                    |
| phone_number|string      | null: false                    |
| user        |references  | null: false, foreign_key: true |

### Association

- belongs_to :user