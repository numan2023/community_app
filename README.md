# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| age               | string | null: false |
| term               | string | null: false |
| past               | string | null: false |
| student_type               | string | null: false |
| hobby               | string | null: false |
| learn_reason               | text | null: false |
| career_pass               | text | null: false |
| impressed_app               | string | null: false |

### Association

- has_many :learnings
- has_many :jobs
- has_many :others


## learning テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| content   | text | null: false |
| image   | -- | null: false |
| tag   | --- | null: false |
| url   | text | null: false |

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
| content   | text | null: false |
| image   | -- | null: false |
| tag   | --- | null: false |
| url   | text | null: false |

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


## others テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| content   | text | null: false |
| image   | -- | null: false |
| tag   | --- | null: false |
| url   | text | null: false |

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