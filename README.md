# アプリケーション名

community_app

## アプリケーション概要

- テックキャンプ受講生（卒業生含む）コミュニティスペースです。
- 受講生の情報や学習・就活関連のTipsを共有して評価する機能を有しています。

## URL

https://community-app-64tj.onrender.com/

## テスト用アカウント

アカウント1：
- email : yamada@taro.com
- password : yamada123

アカウント2：
- email : kobayashi@ziro.com
- password : kobayashi123

## 利用方法

1. ユーザー登録を行う
2. 学習チャットルームと就活チャットルームに共有したい内容を投稿する
3. 評価する投稿にいいねをする
4. トップページに高評価ランキング順に表示される。

## アプリケーションを作成した背景

- 学習者同士のTipsやその他情報の共有が対面や個別チャットスペースとなっており、Tipsが蓄積されていないと感じました。
  そのため学習の効率化・合理化が図れる情報共有・蓄積できるアプリが必要と考えました。
- 「エンジニアになりたい」という同じ思いのバックグラウンドが異なる学習者同士がもっと関係構築しやすくするために、事前にユーザー情報の開示・共有できると良いと考えたため同アプリを作成しました。

## 洗い出した要件

- ユーザー管理機能
・ユーザー新規登録できる
・ログインできる
・ユーザー情報を編集できる
・ログアウトできる

- Tips投稿機能
・常設の学習関連、就活関連のチャットルームでそれぞれ共有した情報を投稿することができる

- いいね機能
・各チャットルームに投稿された情報にいいねすることができる
・いいねの数がランキング化され、トップページに表示される

## 実装した機能についての画像やGIF及びその他説明

- 投稿された情報に評価することができる
https://i.gyazo.com/92636ba258e38712c7a1d42389899715.gif

## 実装予定の機能

- 非同期通信
- タグ付け
- 詳細検索

## データベース設計

- community_app.dioをご参照ください。

## 画像遷移図

- community_app.dioをご参照ください。

## 開発環境

- Ruby on Rails
- Bootstrap
- JavaScript

## ローカルでの動作方法

% git clone https://github.com/numan2023/community_app.git
% cd community_app
% bundle install
% rails db:create
% rails db:migrate
% rails s

## 工夫したポイント

- いい情報をすぐに確認できるようトップページに評価の高い投稿がランキング形式で表示されるように設定しました。
- チャットルームを個別に作成するようにせず、すでに設定されたチャットルームでそれぞれ投稿・評価することで用途が明確になるようにしました。


## テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| term               | string | null: false |
| hobby              | text   | null: false |
| learn_reason       | text   | null: false |
| career_pass        | text   | null: false |
| impressed_app      | string | null: false |
| age                | string | null: false | ## 〇〇代 (Active_Hash)
| past_career        | string | null: false | ## (Active_Hash)
| student_type       | string | null: false | ## (Active_Hash)

### Association

- has_many :learnings
- has_many :jobs
- has_many :others


## learning テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | null: false                    |
| title   | string     | null: false                    |
| content | text       | null: true                     |
| user    | references | null: false, foreign_key: true |
| tag     | ---------- | null: false                    |

### Association

- belongs_to :user
- has_many :learning_users_likes


## learning_users_like テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| learning   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :learning


## job テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | null: false                    |
| title   | string     | null: false                    |
| content | text       | null: true                     |
| user    | references | null: false, foreign_key: true |
| tag     | ---------- | null: false                    |

### Association

- belongs_to :user
- has_many :learning_users_likes


## jpb_users_like テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| job    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :job


## other テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | null: false                    |
| title   | string     | null: false                    |
| content | text       | null: true                     |
| user    | references | null: false, foreign_key: true |
| tag     | ---------- | null: false                    |

### Association

- belongs_to :user
- has_many :learning_users_likes


## other_users_like テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| other  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :other