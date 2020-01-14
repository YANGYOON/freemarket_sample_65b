100.times do |n|
  name = Faker::Name.name
  email = Faker::Internet.email
  content = "Hogehoge"

  User.create(
    name: name,
    email: email,
    content: content
  )
end