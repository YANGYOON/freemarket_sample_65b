30.times do |n|
  user_count = n
  Like.create(
    user_id:user_count,
    item_id:"1",
  )
end