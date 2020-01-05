crumb :root do
  link "トップページ", root_path
end

crumb :mypage do
  link "マイページ", users_path
end

crumb :user_profiles do
  link "本人情報の登録", user_profiles_path
  parent :mypage
end

crumb :creditcards do
  link "支払い方法", creditcards_path
  parent :mypage
end