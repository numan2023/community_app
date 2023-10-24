# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| term               | string | null: false |
| hobby               | text | null: false |
| learn_reason               | text | null: false |
| career_pass               | text | null: false |
| impressed_app               | string | null: false |
| age               | string | null: false | ## 〇〇代 (Active_Hash)
| past_career               | string | null: false | ## (Active_Hash)
| student_type               | string | null: false | ## (Active_Hash)

### Association

- has_many :learnings
- has_many :jobs
- has_many :others


## learning テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| content   | string | null: false |
| url   | string | null: true |
| user   | references | null: false, foreign_key: true |
| image   | -- | null: false | # Active Storage
| tag   | --- | null: false |　# 追加実装

### Association

- belongs_to :user
- has_many :learning_users_likes


## learning_users_like テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| learning   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :learning


## job テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| content   | string | null: false |
| url   | string | null: true |
| user   | references | null: false, foreign_key: true |
| image   | -- | null: false | # Active Storage
| tag   | --- | null: false |　# 追加実装

### Association

- belongs_to :user
- has_many :learning_users_likes


## jpb_users_like テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| job   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :job


## other テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| content   | string | null: false |
| url   | string | null: true |
| user   | references | null: false, foreign_key: true |
| image   | -- | null: false | # Active Storage
| tag   | --- | null: false |　# 追加実装

### Association

- belongs_to :user
- has_many :learning_users_likes


## other_users_like テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| other   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :other