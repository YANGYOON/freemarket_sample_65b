#乃木坂
[
  ['齋藤飛鳥','写真集','新品、未使用',230,2380,1,309,63 ],
  ['与田優希','写真集','新品、未使用',10,2380,1,309,63 ]
  ['秋本真夏','写真集','新品、未使用',10,2380,1,309,63 ]
  ['衛藤美彩','写真集','新品、未使用',10,2380,1,309,63 ]
  ['橋本奈々美','写真集','新品、未使用',10,2380,1,309,63 ]
  ['橋本奈々美','写真集2','新品、未使用',10,2380,1,309,63 ]
  ['堀未央奈','写真集','新品、未使用',10,2380,1,309,63 ]
  ['堀未央奈','写真集2','新品、未使用',10,2380,1,309,63 ]
  ['星野みなみ','写真集','新品、未使用',10,2380,1,309,63 ]
  ['深川麻衣','写真集','新品、未使用',10,2380,1,309,63 ]
  ['生駒里奈','写真集','新品、未使用',10,2380,1,309,63 ]
  ['生田絵梨花','写真集','新品、未使用',10,2380,1,309,63 ]
  ['井上小百合','写真集','新品、未使用',10,2380,1,309,63 ]
  ['松村沙友理','写真集','新品、未使用',10,2380,1,309,63 ]
  ['西野七瀬','写真集','新品、未使用',10,2380,1,309,63 ]
  ['西野七瀬','写真集2','新品、未使用',10,2380,1,309,63 ]
  ['桜井玲香','写真集2','新品、未使用',10,2380,1,309,63 ]
  ['新内眞衣','写真集','新品、未使用',10,2380,1,309,63 ]
  ['白石麻衣','写真集','新品、未使用',10,2380,1,309,63 ]
  ['白石麻衣','写真集2','新品、未使用',10,2380,1,309,63 ]
  ['高山一実','写真集','新品、未使用',10,2380,1,309,63 ]
  ['若月佑美','写真集','新品、未使用',10,2380,1,309,63 ]
  ['山本美月','写真集','新品、未使用',10,2380,1,309,63 ]
].each do |name, state,condition,likes_count,price,seller_id,category_id,brand_id|
Item.create(
  { name: name, state: state, condition: condition, likes_count:likes_count,price: price,seller_id:seller_id,category_id:category_id,brand_id:brand_id}
)
end

[
  [ open("#{Rails.root}/db/fixtures/idol/saitouasuka.jpg"), 1],
  [ open("#{Rails.root}/db/fixtures/idol/yoda.jpg"), 2],
  [ open("#{Rails.root}/db/fixtures/idol/akimoto.jpg"), 3],
  [ open("#{Rails.root}/db/fixtures/idol/etou.jpg"), 4],
  [ open("#{Rails.root}/db/fixtures/idol/hasimoto.jpg"), 5],
  [ open("#{Rails.root}/db/fixtures/idol/hasimoto2.jpg"), 6],
  [ open("#{Rails.root}/db/fixtures/idol/hori.jpg"), 7],
  [ open("#{Rails.root}/db/fixtures/idol/hori2.jpg"), 8],
  [ open("#{Rails.root}/db/fixtures/idol/hosino.jpg"), 9],
  [ open("#{Rails.root}/db/fixtures/idol/hukagawa.jpg"), 10],
  [ open("#{Rails.root}/db/fixtures/idol/ikoma.jpg"), 11],
  [ open("#{Rails.root}/db/fixtures/idol/ikuta.jpg"), 12],
  [ open("#{Rails.root}/db/fixtures/idol/inoue.jpg"), 13],
  [ open("#{Rails.root}/db/fixtures/idol/matumura.jpg"), 14],
  [ open("#{Rails.root}/db/fixtures/idol/nisino2.jpg"), 15],
  [ open("#{Rails.root}/db/fixtures/idol/nisino3.jpg"), 16],
  [ open("#{Rails.root}/db/fixtures/idol/sakurai.jpg"), 17],
  [ open("#{Rails.root}/db/fixtures/idol/sinuti.jpg"), 18],
  [ open("#{Rails.root}/db/fixtures/idol/siraisi.jpg"), 19],
  [ open("#{Rails.root}/db/fixtures/idol/siraisi2.jpg"), 20],
  [ open("#{Rails.root}/db/fixtures/idol/takayama.jpg"), 21],
  [ open("#{Rails.root}/db/fixtures/idol/wakatuki.jpg"), 22],
  [ open("#{Rails.root}/db/fixtures/idol/yamashita2.jpeg"), 23],
].each do |image, item_id|
Image.create(
  { image: image, item_id: item_id}
)
end

#car
10.times do |n|
  name = "#{n}車"
  Item.create!(
    name:name, 
    state:"外車",
    condition:"新品、未使用",
    likes_count:20,
    price:2000000,
    seller_id:1,
    category_id:451,
    brand_id:99,
  )
end
10.times do |n|
  image = open("#{Rails.root}/db/fixtures/car/#{n}.jpeg")
  item_id = n+23
  Image.create!(
    image:image, 
    item_id:item_id,
  )
end



[
[ '送料込み','東京都','1~2日で発送','ゆうパック',1],
].each do |method, prefecture_from,period_before_shopping,fee_burden,item_id|
Shipping.create(
  { method: method, prefecture_from: prefecture_from,period_before_shopping:period_before_shopping,fee_burden:fee_burden,item_id:item_id,}
)
end