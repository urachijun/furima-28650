# README

This README would normally document whatever steps are necessary to get the
application up and running.

## users テーブル

| Columun            | Type    | Options                 |
| ------------------ | ------- | ----------------------- |
| nickname           | string  | null: false             |
| email              | string  | null: false unique:true |
| encrypted_password | string  | null: false             |
| last_name          | string  | null: false             |
| first_name         | string  | null: false             |
| last_name_kana     | string  | null: false             |
| first_name_kana    | string  | null: false             |
| birthday           | date    | null: false             |

### Association

- has_many :items
- has_many :purchases

##  items テーブル

| Columun                | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| name                   | string     | null: false                    |
| description            | text       | null: false                    |
| category_id            | integer    | null: false                    |
| state_id               | integer    | null: false                    |
| shipping_fee_burden_id | integer    | null: false                    |
| prefecture_id          | integer    | null: false                    |
| shipping_day_id        | integer    | null: false                    |
| price                  | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase
- belongs_to_active_hush :item_category
- belongs_to_active_hush :item_state
- belongs_to_active_hush :shipping_fee_burden
- belongs_to_active_hush :shipping_day
- belongs_to_active_hush :prefecture

## purchases テーブル

| Columun | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Columun       | Type       | Options                       |
| ------------- | ---------- | ----------------------------- |
| postal_code   | string     | null: false                   |
| prefecture_id | integer    | null: false                   |
| city          | string     | null: false                   |
| house_number  | string     | null: false                   |
| building_name | string     |                               |
| phone_number  | string     | null: false                   |
| purchase      | references | null: false foreign_key: true |

### Association

- belongs_to :purchase
- belongs_to_active_hush :prefecture


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
