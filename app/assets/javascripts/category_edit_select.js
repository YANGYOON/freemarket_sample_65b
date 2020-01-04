// 商品編集ページにおけるカテゴリィセレクトボックスの削除
$(document).on('change', '#category_select', function(){
  // 親の選択肢を変えたら、子と孫とサイズを削除｡
  $('.edit_select-children').remove();
  $('.item_select-grandchildren').remove();
});

$(document).on('change', '#child_category',function(){
  $('.edit_selecte-grandchildren').remove();
});