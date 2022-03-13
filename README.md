# README

## 開発言語

- Ruby 3.0.1
- Rails 6.0.4

## 取り入れた技術

- メッセージ機能
- フォロー機能
- コメント機能
- お気に入り機能
- ログイン機能 (devise)
- 管理者機能 (rails_admin)
- 権限管理 (cancancan)
- 画像投稿機能 (carrierwave)
- 検索機能 (ransack)
- ページネーション (kaminari)
- gem active_hash

## 実行手順

```
$ git clone git@github.com:fujisawagithub/nanbyo_connect.git
$ cd nanbyo_connect
$ bundle install
$ rails db:create db:migrate
$ rails db:seed
$ rails s
```

## カタログ設計

https://docs.google.com/spreadsheets/d/1euw1yJwkfKTRru_60_pyI0GfIXTWCCal7emeHwR73Ys/edit?usp=sharing

## テーブル定義書

https://docs.google.com/spreadsheets/d/1_b4SCW6ZNiu6drtGvsKz-Ls4MAD2pYaoVzFS3kiK4QM/edit?usp=sharing

## ER 図

![image](https://github.com/fujisawagithub/nanbyo_connect/blob/main/docs/er_diagram3.png)

## 画面遷移図

![image](https://github.com/fujisawagithub/nanbyo_connect/blob/main/docs/screen_transition_diagram3.png)

## ワイヤーフレーム

https://cacoo.com/diagrams/QGm3QGDHp9dpe8UR/8BA9D
