<h2 align="center">Chat App</h2>

<p align="center">
  <img src="スクリーンショット 2020-07-09 16.59.07.png" width="250px;"/>
</p>

# 概要
**LINE風のチャットアプリ**です。ユーザーは、テキストベースのチャットを通じて会話を楽しむことができます。

# 制作期間
3日間

# 制作背景(意図)
Swiftの新しい項目としてtableview、Lottieの使い方、Firebaseを学習したいと思ったため、制作に至りました。
 
# DEMO
## 1 ログイン or 新規登録
<p align="center">
  <img src="59095a4da19a13cbef4a73dad3b2d5f0.gif" width="250px;"/>
  <img src="スクリーンショット 2020-07-09 17.47.06.png" width="250px;"/>
</p>

## 2 メッセージを送信
<p align="center">
  <img src="2a6ac9404ed18f8d29c508f782b23fa2.gif" width="250px;"/>
</p>

# 工夫したポイント
- データベースとしてのFirebaseを使用し、再度ビルドしてもチャットの履歴が残るようにしました。
- 機能を限定的にすることで、ユーザーの操作性を高く保つように設計しました。
- 自分のメッセージと相手のメッセージを色分けすることで、サービスの見やすさ・使いやすさを重視しました。

# 使用技術(開発環境)
Swift/Xcode/Github/Firebase

# 課題や今後実装したい機能
<dl>
  <dt>画像を送信できない</dt>
  <dd>画像を送信できるようにする</dd>
  <dt>iPhone１１以外の機種を使用すると、ビューが崩れてしまう</dt>
  <dd>AutoLayoutを使って、マルチデバイスを実現する</dd>
</dl>

# DB設計
## usersテーブル

|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|

### Association
- has_many :messages

## messagesテーブル

|Column|Type|Options|
|------|----|-------|
|message|string|null: false|
|sender|integer|null: false, foreign_key: :true|

### Association
- belongs_to :user
