# README
![](https://img.shields.io/badge/ruby-2.5.1-red)
![](https://img.shields.io/badge/rails-5.2.4.1-red)
![](https://img.shields.io/badge/AWS-EC2-orange)
![](https://img.shields.io/badge/AWS-S3-orange)
![](https://img.shields.io/badge/mysql-56-blue)
![](https://img.shields.io/badge/jQuery-%20-blue)


## Name:freemarketアプリケーション

## 📕Description
TECH::EXPER在籍中にチーム開発として制作したECアプリケーションになります。

## 📕工夫点
カリキュラム外のオリジナル機能として以下の機能を付加しています。  
google analytics  
コメント機能  
トレンド機能  
ランキング機能  
Like機能  
管理者権限機能  

## 📕Demo
[![Image from Gyazo](https://i.gyazo.com/a5a498895abff451ed43e5c7b4b5f6e4.gif)](https://gyazo.com/a5a498895abff451ed43e5c7b4b5f6e4)  


## 🖥デモサイト⬇︎  
http://18.177.235.133/

## 📕Usage
このアプリには下記の機能があります。  
Basic認証(ID:admin/pass:0601)  
ユーザー登録機能(登録にはmail/Facebook/Google)  
ユーザーログイン/ログアウト機能  
商品購入機能(pay.jp対応)  
商品出品機能  
商品編集機能  
商品削除機能  
商品詳細機能  
カテゴリ機能  
商品検索機能(ワード検索/詳細検索)  
パンくず機能  

## 📕Install
https://github.com/Milia-yuuta/freemarket_sample_65b.git  

## 💳Licence
[Licence](https://raw.githubusercontent.com/Milia-yuuta/freemarket_sample_65b/master/LICENSE)

## Author
櫻田：[Twitter](https://twitter.com/yuuta_sakurada)  
高砂：  
武石：  
田中：[HP](https://ttportfolio.herokuapp.com/)  
劉：[Facebook]()  

# DB設計図
## users テーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|
|self_introduction|text|-------|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birth_year|string|null: false|
|birth_month|string|null: false|
|birth_day|string|null: false|
### Association
- has_many :sns_links dependent: :destroy
- has_many :comments dependent: :destroy
- has_many :likes dependent: :destroy
- has_many :reviews dependent: :destroy
- has_many :items dependent: :destroy
- has_one :creditcard
- has_one :address
- has_one :phone_number

## phone_number　テーブル
|Column|Type|Options|
|------|----|-------|
|phone_number|string|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user


## address テーブル
|Column|Type|Options|
|------|----|-------|
|zipcode|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|detail_address|string|null: false|
|building|string|-------|
|optional_phone_number|string|-------|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user



## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|state|text|null: false|
|condition|string|null: false|
|price|integer|null: false|
|category_id|integer|null: false, foreign_key: true|
|review_id|integer|null: false, foreign_key: true|
|brand_group_id|integer|null: false, foreign_key: true|
|size_id|integer|null: false, foreign_key: true|
|buyer_id|integer|foreign_key: true|
|seller_id|integer|null: false, foreign_key: true|
### Association
- has_many :images dependent: :destroy
- has_many :likes
- belongs_to :category
- belongs_to :review
- belongs_to :brand_group
- belongs_to :size
- belongs_to :buyer,class_name: "User"
- belongs_to :seller,class_name: "User"
- has_one :shipping dependent: :destroy

## shippingテーブル
|Column|Type|Options|
|------|----|-------|
|method|string|null: false|
|prefecture_from|string|null: false|
|period_before_shopping|string|null: false|
|fee_burden|string|null: false|
|item_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :item

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
|comment|text|null: false|
### Association
- belongs_to :user
- belongs_to :item

## reviewsテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
|review|text||
|rate|integer|null: false|
### Association
- belongs_to :user
- belongs_to :item

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item

## sns_link テーブル
|Column|Type|Options|
|------|----|-------|
|security_token|text|null: false|
|uid|text|null: false|
|provider|text|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
-belongs_to :user

## creditcard テーブル
|Column|Type|Options|
|------|----|-------|
|security_token|text|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
-belongs_to :user

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|parent_id|integer|foreign_key: true|
|grandparent_id|integer|foreign_key: true|
### Association
- has_many :items

## brand_groupテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|
### Association
- has_many :items
- has_many :brands

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|
|brand_group_id|references|null: false, foreign_key: true|
### Association
- belongs_to :brand_group

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
|item_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :item



## sizeテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :items