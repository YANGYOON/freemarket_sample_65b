200.times do |n|
  name = Faker::Name.name
  email = Faker::Internet.email
  nickname = "#{n}子"
  birth_year = rand(1900..2020)
  age = rand(12..65)
  user_id = n+1
  User.create(
    nickname:nickname,
    email: email,
    first_name: "散布流",
    last_name: "太郎",
    first_name_kana: "サンプル",
    last_name_kana: "タロウ",
    birth_year: birth_year,
    birth_month: "01",
    birth_day: "01",
    password:  "abcd1234",
    password_confirmation: "abcd1234",
    USER_ID:user_id,
    AGE:age,
  )
end