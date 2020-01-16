200.times do |n|
  name = Faker::Name.name
  email = Faker::Internet.email
  nickname = "#{n}子"
  User.create(
    nickname:nickname,
    email: email,
    first_name: "散布流",
    last_name: "太郎",
    first_name_kana: "サンプル",
    last_name_kana: "タロウ",
    birth_year: "2000",
    birth_month: "01",
    birth_day: "01",
    password:  "abcd1234",
    password_confirmation: "abcd1234",
  )
end