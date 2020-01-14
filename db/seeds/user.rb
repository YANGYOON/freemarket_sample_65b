100.times do |n|
  name = Faker::Name.name
  email = Faker::Internet.email
  nickname = "#{n}子"
  User.create!(
    nickname:nickname,
    email: email,
    first_name: "田中",
    last_name: "孝良",
    first_name_kana: "タロウ",
    last_name_kana: "カンリシャ",
    birth_year: "2000",
    birth_month: "01",
    birth_day: "01",
    password:  "abcd1234",
    password_confirmation: "abcd1234",
  )
end