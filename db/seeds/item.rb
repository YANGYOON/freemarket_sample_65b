[
['齋藤飛鳥','写真集','新品、未使用',230,2380,1,309,63 ]
].each do |name, state,condition,likes_count,price,seller_id,category_id,brand_id|
Item.create(
  { name: name, state: state, condition: condition, likes_count:likes_count,price: price,seller_id:seller_id,category_id:category_id,brand_id:brand_id}
)
end

[
[ open("#{Rails.root}/db/fixtures/idol/saitouasuka.jpg"), 3],
].each do |image, item_id|
Image.create(
  { image: image, item_id: item_id}
)
end

[
[ '送料込み','東京都','1~2日で発送','ゆうパック',3],
].each do |method, prefecture_from,period_before_shopping,fee_burden,item_id|
Shipping.create(
  { method: method, prefecture_from: prefecture_from,period_before_shopping:period_before_shopping,fee_burden:fee_burden,item_id:item_id,}
)
end