# アプリケーション名

TOTONOU(ととのう)

# アプリケーション概要

全国のサウナ施設の情報を共有し、コミュニケーションをとることができる。

# URL

https://totonou.herokuapp.com/

# テスト用アカウント
ベーシック認証ID：koiazi  
ベーシックん認証パスワード：1018  
メールアドレス:a@mail  
パスワード：abc123  


# 利用方法

## サウナ施設投稿
１、トップページのヘッダーからユーザー新規登録を行う  
２、ヘッダーの投稿するボタンからサウナ施設の情報を投稿する

## コメント投稿
１、トップページの施設一覧の画像をクリックして、施設の詳細を確認する。  
２、サウナに行った感想や撮影した写真などあればいいねボタンやコメントを送る。


# 洗い出した要件

https://docs.google.com/spreadsheets/d/165nSG2_wNOor8kEBqWTxODzCcy-TgXUmXerxqBRjirw/edit?usp=sharing

# 実装した機能についての画像やGIFおよびその説明
いいね機能  
<a href="https://gyazo.com/710e3ae5aaf339a891904277de505876"><img src="https://i.gyazo.com/710e3ae5aaf339a891904277de505876.gif" alt="Image from Gyazo" width="1000"/></a>  
検索機能  
[![Image from Gyazo](https://i.gyazo.com/72cfd4487633d9471c6966d3e4492573.gif)](https://gyazo.com/72cfd4487633d9471c6966d3e4492573)  
  
コメント機能  
[![Image from Gyazo](https://i.gyazo.com/a3019efcfa8b86f0b3790408ae73d8d7.gif)](https://gyazo.com/a3019efcfa8b86f0b3790408ae73d8d7)  



# 実装予定の機能

混雑状況の投稿機能を非同期通信を使用して実装予定

# 画面遷移図

[![Image from Gyazo](https://i.gyazo.com/6a4ba0ba1c30c40327fb4e47b6450cbc.png)](https://gyazo.com/6a4ba0ba1c30c40327fb4e47b6450cbc)

# データベース設計

[![Image from Gyazo](https://i.gyazo.com/e9cfdcec25d99540cc962a3bc0a2bf18.png)](https://gyazo.com/e9cfdcec25d99540cc962a3bc0a2bf18)

# 開発環境

Ruby/Ruby on Rails/MySQL/Github/AWS/Visual Studio Code

# 工夫したポイント

今回サウナ施設の情報と、それに紐づく男湯・女湯のサウナ室の情報を別テーブルとし、フォームオブジェクトを使用して一括でデータベースに保存する仕様にしました。  
１回の操作で３つのテーブルを扱うため、モデル同士の繋がりやデータの受け渡しを慎重に確認しながら進めました。  
また、jQueryを使用して非同期通信のいいね機能を実装しました。  
今回はlikesテーブルを作成し、ユーザーがいいねをすでに押したかどうかを判断してビューに反映させる方法を取りました。
