# README

## users テーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|
### Association
- has_many :sns_links
- has_many :comments
- has_many :likes
- has_many :reviews
- has_many :items
- has_one :user_profile
- has_one :creditcard
- has_one :address

## user_profile テーブル
|Column|Type|Options|
|------|----|-------|
|self_introduction|text|-------|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birth_year|string|null: false|
|birth_month|string|null: false|
|birth_day|string|null: false|
|phone_number|string|null: false|
|optinal_phone_number|string||
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user

## address テーブル
|Column|Type|Options|
|------|----|-------|
|zipcode|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|district|string|-------|
|building|string|-------|
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
|shipping_id|integer|null: false, foreign_key: true|
### Association
- has_many :images
- has_many :likes
- belongs_to : category
- belongs_to : review
- belongs_to : brand_group
- belongs_to : size
- belongs_to : buyer
- belongs_to : seller
- belongs_to : shipping

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
- has_many : items

## brand_groupテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|
### Association
- has_many : items
- has_many : brands

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|
|brand_group_id|references|null: false, foreign_key: true|
### Association
- belongs_to : brand_group

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
|item_id|integer|null: false, foreign_key: true|
### Association
- belongs_to : item

## shippingテーブル
|Column|Type|Options|
|------|----|-------|
|method|string|null: false|
|prefecture_from|string|null: false|
|period_before_shopping|string|null: false|
|fee_burden|string|null: false|
### Association
- belongs_to : item

## sizeテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many : items
