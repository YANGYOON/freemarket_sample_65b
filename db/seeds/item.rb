#乃木坂/tiket
[
  ['齋藤飛鳥','写真集','新品、未使用',2380,1,309,63 ],
  ['与田優希','写真集','新品、未使用',2380,1,309,63 ],
  ['秋本真夏','写真集','新品、未使用',2380,1,309,63 ],
  ['衛藤美彩','写真集','新品、未使用',2380,1,309,63 ],
  ['橋本奈々美','写真集','新品、未使用',2380,1,309,63 ],
  ['橋本奈々美','写真集2','新品、未使用',2380,1,309,63 ],
  ['堀未央奈','写真集','新品、未使用',2380,1,309,63 ],
  ['堀未央奈','写真集2','新品、未使用',2380,1,309,63 ],
  ['星野みなみ','写真集','新品、未使用',2380,1,309,63 ],
  ['深川麻衣','写真集','新品、未使用',2380,1,309,63 ],
  ['生駒里奈','写真集','新品、未使用',2380,1,309,63 ],
  ['生田絵梨花','写真集','新品、未使用',2380,1,309,63 ],
  ['井上小百合','写真集','新品、未使用',2380,1,309,63 ],
  ['松村沙友理','写真集','新品、未使用',2380,1,309,63 ],
  ['西野七瀬','写真集','新品、未使用',2380,1,309,63 ],
  ['西野七瀬','写真集2','新品、未使用',2380,1,309,63 ],
  ['桜井玲香','写真集2','新品、未使用',2380,1,309,63 ],
  ['新内眞衣','写真集','新品、未使用',2380,1,309,63 ],
  ['白石麻衣','写真集','新品、未使用',2380,1,309,63 ],
  ['白石麻衣','写真集2','新品、未使用',2380,1,309,63 ],
  ['高山一実','写真集','新品、未使用',2380,1,309,63 ],
  ['若月佑美','写真集','新品、未使用',2380,1,309,63 ],
  ['山下美月','写真集','新品、未使用',2380,1,309,63 ],
  ['上坂すみれ','チケット','新品、未使用',6000,1,430,92 ],
  ['水樹奈々','チケット','新品、未使用',7200,1,430,92 ],
  ['米津','チケット','新品、未使用',2380,1,427,92 ],
  ['柿原哲也','チケット','新品、未使用',2380,1,430,92 ],
  ['宮野真守','チケット','新品、未使用',2380,1,430,92 ],
  ['蒼井翔太','チケット','新品、未使用',2380,1,430,92 ],
  ['柿原','チケット','新品、未使用',2380,1,430,92 ],
  ['小倉唯','チケット','新品、未使用',2380,1,430,92 ],
  ['sumika','チケット','新品、未使用',2380,1,427,92 ],
  ['Lisa','チケット','新品、未使用',2380,1,427,92 ],
  ['髭男','チケット','新品、未使用',2380,1,427,92 ],
].each do |name, state,condition,price,seller_id,category_id,brand_id,likes_count|
Item.create(
  { name: name, state: state, condition: condition, price: price,seller_id:seller_id,category_id:category_id,brand_id:brand_id,likes_count:likes_count}
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
  [ open("#{Rails.root}/db/fixtures/idol/yamashita2.jpg"), 23],
  [ open("#{Rails.root}/db/fixtures/artist/0.jpg"), 24],
  [ open("#{Rails.root}/db/fixtures/artist/1.jpg"), 25],
  [ open("#{Rails.root}/db/fixtures/artist/2.jpg"), 26],
  [ open("#{Rails.root}/db/fixtures/artist/3.jpg"), 27],
  [ open("#{Rails.root}/db/fixtures/artist/4.jpg"), 28],
  [ open("#{Rails.root}/db/fixtures/artist/5.jpg"), 29],
  [ open("#{Rails.root}/db/fixtures/artist/6.jpg"), 30],
  [ open("#{Rails.root}/db/fixtures/artist/7.jpg"), 31],
  [ open("#{Rails.root}/db/fixtures/artist/8.jpg"), 32],
  [ open("#{Rails.root}/db/fixtures/artist/9.jpg"), 33],
  [ open("#{Rails.root}/db/fixtures/artist/10.jpg"), 34],
].each do |image, item_id|
Image.create(
  { image: image, item_id: item_id}
)
end

#car
10.times do |n|
  name = "#{n}車"
  Item.create(
    name:name, 
    state:"外車",
    condition:"新品、未使用",
    price:2000000,
    seller_id:1,
    category_id:451,
    brand_id:99,
    
  )
end
10.times do |n|
  image = open("#{Rails.root}/db/fixtures/car/#{n}.jpg")
  item_id = n+35
  Image.create(
    image:image, 
    item_id:item_id,
  )
end

#コート
9.times do |n|
  name = "#{n}コート"
  Item.create(
    name:name, 
    state:"コート",
    condition:"新品、未使用",
    price:20000,
    seller_id:1,
    category_id:161,
    brand_id:17,
    size_id:13,
  )
end
9.times do |n|
  image = open("#{Rails.root}/db/fixtures/jaket/#{n}.jpg")
  item_id = n+45
  Image.create(
    image:image, 
    item_id:item_id,
  )
end
#scart
5.times do |n|
  name = "#{n}スカート"
  Item.create(
    name:name, 
    state:"コート",
    condition:"新品、未使用",
    price:3180,
    seller_id:1,
    category_id:84,
    brand_id:13,
    size_id:3,
  )
end
5.times do |n|
  image = open("#{Rails.root}/db/fixtures/scart/#{n}.jpg")
  item_id = n+54
  Image.create(
    image:image, 
    item_id:item_id,
  )
end

#magic_card
5.times do |n|
  name = "#{n}magic_sample"
  Item.create(
    name:name, 
    state:"magic",
    condition:"新品、未使用",
    price:1280,
    seller_id:1,
    category_id:317,
    brand_id:64,
  )
end
5.times do |n|
  image = open("#{Rails.root}/db/fixtures/magic/#{n}.jpg")
  item_id = n+59
  Image.create(
    image:image, 
    item_id:item_id,
  )
end

#sniker
10.times do |n|
  name = "#{n}sniker_sample"
  Item.create(
    name:name, 
    state:"sniker",
    condition:"新品、未使用",
    price:1280,
    seller_id:1,
    category_id:187,
    brand_id:17,
    size_id:14,
  )
end
10.times do |n|
  image = open("#{Rails.root}/db/fixtures/sniker/#{n}.jpg")
  item_id = n+64
  Image.create(
    image:image, 
    item_id:item_id,
  )
end

#tokei
5.times do |n|
  name = "#{n}tokei_sample"
  Item.create(
    name:name, 
    state:"時計",
    condition:"新品、未使用",
    price:32000,
    seller_id:1,
    category_id:230,
    brand_id:24,
    size_id:14,
  )
end
5.times do |n|
  image = open("#{Rails.root}/db/fixtures/time/#{n}.jpg")
  item_id = n+74
  Image.create(
    image:image, 
    item_id:item_id,
  )
end

#バッシュ
20.times do |n|
  name = "#{n}basket_sample"
  Item.create(
    name:name, 
    state:"バスケットシューズ",
    condition:"新品、未使用",
    price:12800,
    seller_id:1,
    category_id:361,
    brand_id:90,
  )
end
20.times do |n|
  image = open("#{Rails.root}/db/fixtures/basket/#{n}.jpg")
  item_id = n+79
  Image.create(
    image:image, 
    item_id:item_id,
  )
end

#ゴーグル
10.times do |n|
  name = "#{n}goggle_sample"
  Item.create(
    name:name, 
    state:"ゴーグル",
    condition:"未使用に近い",
    price:11800,
    seller_id:1,
    category_id:371,
    brand_id:90,
  )
end
10.times do |n|
  image = open("#{Rails.root}/db/fixtures/gogle/#{n}.jpg")
  item_id = n+99
  Image.create(
    image:image, 
    item_id:item_id,
  )
end

#漫画
20.times do |n|
  name = "#{n}漫画_sample"
  Item.create(
    name:name, 
    state:"人気漫画",
    condition:"未使用に近い",
    price:420,
    seller_id:1,
    category_id:278,
    brand_id:60,
  )
end
20.times do |n|
  image = open("#{Rails.root}/db/fixtures/manga/#{n}.jpg")
  item_id = n+109
  Image.create(
    image:image, 
    item_id:item_id,
  )
end

#sumaho
21.times do |n|
  name = "#{n}smart-phone_sample"
  Item.create(
    name:name, 
    state:"人気スマホ",
    condition:"未使用に近い",
    price:38000,
    seller_id:1,
    category_id:378,
    brand_id:83,
  )
end
21.times do |n|
  image = open("#{Rails.root}/db/fixtures/sumaho/#{n}.jpg")
  item_id = n+129
  Image.create(
    image:image, 
    item_id:item_id,
  )
end

#tablet
20.times do |n|
  name = "#{n}tablet_sample"
  Item.create(
    name:name, 
    state:"人気タブレット",
    condition:"未使用に近い",
    price:28900,
    seller_id:1,
    category_id:381,
  )
end
20.times do |n|
  image = open("#{Rails.root}/db/fixtures/tablet/#{n}.jpg")
  item_id = n+150
  Image.create(
    image:image, 
    item_id:item_id,
  )
end

170.times do |n|
  item_count = n
  Shipping.create(
    method:'送料込み',
    prefecture_from:'東京都',
    period_before_shopping:'1~2日で発送',
    fee_burden:'ゆうパック',
    item_id:item_count,
  )
end