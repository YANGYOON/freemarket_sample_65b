// 商品編集ページにおけるカテゴリィセレクトボックスの削除
$(document).on('change', '#category_select', function(){
  // 親の選択肢を変えたら、子と孫とサイズを削除｡
  $('.edit_select-children').remove();
  $('.item_select-grandchildren').remove();
});

$(document).on('change', '#child_category',function(){
  $('.edit_selecte-grandchildren').remove();
});

$(document).on('turbolinks:load', function() {
  let img_count = $('.input_images').size();
  switch (img_count){
    case 0:
      $('.contents__main__image__box__previews').css({
        'display':'none'
      });
      $('.contents__main__image__box__uploader').css({
        'width':'500%',
        'grid-column-start':'1',
        'grid-row-start':'1'
      });
      break;
    case 1:
      $('.contents__main__image__box__previews').css({
        'display':'grid',
        'grid-template-rows':'repeat(1, 165px)',
        'grid-template-columns':'repeat(1, 120px)',
        'width':'120px'
      });
      $('.contents__main__image__box__uploader').css({
        'width':'400%',
        'grid-column-start':'2',
        'grid-row-start':'1'
      });
      break;
    case 2:
      $('.contents__main__image__box__previews').css({
        'display':'grid',
        'grid-template-rows':'repeat(1, 165px)',
        'grid-template-columns':'repeat(2, 120px)',
      });
      $('.contents__main__image__box__uploader').css({
        'width':'300%',
        'grid-column-start':'3',
        'grid-row-start':'1'
      });
      break;
    case 3:
      $('.contents__main__image__box__previews').css({
        'display':'grid',
        'grid-template-rows':'repeat(1, 165px)',
        'grid-template-columns':'repeat(3, 120px)',
      });
      $('.contents__main__image__box__uploader').css({
        'width':'200%',
        'grid-column-start':'4',
        'grid-row-start':'1'
      });
      break;
    case 4:
      $('.contents__main__image__box__previews').css({
        'display':'grid',
        'grid-template-rows':'repeat(1, 165px)',
        'grid-template-columns':'repeat(4, 120px)',
      });
      $('.contents__main__image__box__uploader').css({
        'width':'120px',
        'grid-column-start':'5',
        'grid-row-start':'1'
      });
      $('.contents__main__image').css({
        'height':'190px'
      });
      break;
    case 5:
      $('.contents__main__image__box__previews').css({
        'display':'grid',
        'grid-template-rows':'repeat(1, 165px)',
        'grid-template-columns':'repeat(5, 120px)',
      });
      $('.contents__main__image__box__uploader').css({
        'grid-template-rows':'repeat(2, 169px)',
        'width':'500%',
        'grid-column-start':'1',
        'grid-row-start':'2'
      });
      $('.contents__main__image').css({
        'height':'360px'
      });
      break;
    case 6:
      $('.contents__main__image__box__previews').css({
        'display':'grid',
        'grid-template-rows':'repeat(2, 165px)',
        'grid-template-columns':'repeat(5, 120px)',
      });
      $('.contents__main__image__box__uploader').css({
        'grid-template-rows':'repeat(2, 169px)',
        'width':'400%',
        'grid-column-start':'2',
        'grid-row-start':'2'
      });
      $('.contents__main__image').css({
        'height':'360px'
      });
      break;
    case 7:
      $('.contents__main__image__box__previews').css({
        'display':'grid',
        'grid-template-rows':'repeat(2, 165px)',
        'grid-template-columns':'repeat(5, 120px)',
      });
      $('.contents__main__image__box__uploader').css({
        'grid-template-rows':'repeat(2, 169px)',
        'width':'300%',
        'grid-column-start':'3',
        'grid-row-start':'2'
      });
      $('.contents__main__image').css({
        'height':'360px'
      });
      break;
    case 8:
      $('.contents__main__image__box__previews').css({
        'display':'grid',
        'grid-template-rows':'repeat(2, 165px)',
        'grid-template-columns':'repeat(5, 120px)',
      });
      $('.contents__main__image__box__uploader').css({
        'grid-template-rows':'repeat(2, 169px)',
        'width':'200%',
        'grid-column-start':'4',
        'grid-row-start':'2'
      });
      $('.contents__main__image').css({
        'height':'360px'
      });
      break;
    case 9:
      $('.contents__main__image__box__previews').css({
        'display':'grid',
        'grid-template-rows':'repeat(2, 165px)',
        'grid-template-columns':'repeat(5, 120px)',
      });
      $('.contents__main__image__box__uploader').css({
        'display':'grid',
        'grid-template-rows':'repeat(2, 169px)',
        'width':'100%',
        'grid-column-start':'5',
        'grid-row-start':'2'
      });
      $('.contents__main__image').css({
        'height':'360px'
      });
      break;
    case 10:
      $('.contents__main__image__box__previews').css({
        'display':'grid',
        'grid-template-rows':'repeat(2, 165px)',
        'grid-template-columns':'repeat(5, 120px)',
      });
      $('.contents__main__image__box__uploader').css({
        'display':'none',
      });
      $('.contents__main__image').css({
        'height':'360px'
      });
      break;
  }
});