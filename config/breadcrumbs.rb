crumb :root do
  link "トップページ", root_path
end

crumb :mypage do
  link "マイページ", mypage_user_path
end

crumb :user_profiles do
  link "本人情報の登録", identification_user_path
  parent :mypage
end

crumb :change_profiles do
  link "本人情報の登録", change_profile_user_path
  parent :mypage
end

crumb :creditcards do
  link "支払い方法", creditcards_path
  parent :mypage
end

crumb :purchase do
  link "購入した商品 - 取引中", purchase_user_path
  parent :mypage
end

crumb :purchased do
  link "購入した商品 - 取引完了", purchased_user_path
  parent :mypage
end

crumb : do
  link "出品した商品 - 出品中", _path
  parent :mypage
end

crumb : do
  link "出品した商品 - 取引中", _path
  parent :mypage
end

crumb : do
  link "出品した商品 - 売却済み", _path
  parent :mypage
end