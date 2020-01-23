10.times do |n|
  name = "#{n}車"
  Item.create!(
    name:"name", 
    state:"外車",
    condition:"新品、未使用",
    price:2000,
    seller_id:2,
    category_id:451,
    brand_id:99,
    level:0,
    root_category_id:1,
  )
end