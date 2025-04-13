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
| birth_date         | date   | null: false              |

### Association

- has_many :item
- has_many :order

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |
| title  | string     | null: false                    |
| image  | string     | null: false                    |
| price  | integer    | null: false                    |

### Association

- has_many :room_users
- has_many :users, through: :room_users
- has_many :messages

## Orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false,foreign_key: true  |
| user   | references | null: false,foreign_key: true  |


### Association

- belongs_to :item
- belongs_to :user

## Addresses テーブル

| Column      | Type       | Options                        |
| -------     | ---------- | ------------------------------ |
| postal_code |string      | null: false                    |
| activehash  |string      | null: false                    |
| city        |string      | null: false                    |
| line1       |string      | null: false                    |
| line2       |string      | null: false                    |
| phone_number|string      | null: false                    |
| user        |references  | null: false, foreign_key: true |

### Association

- belongs_to :user