$(document).on('click', '.contents__main__submit--button', function() {
  let img_count = $('.input_images').size();
  if (img_count == 0) {
    window.confirm('画像をアップロードしてください')
    return false;
  }
});
$(document).on('mouseleave', '.contents__main__submit--button', function() {
  $('.contents__main__submit--button').css({
    'pointer-events':'auto'
  });
});