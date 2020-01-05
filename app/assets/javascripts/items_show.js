$(function(){
  $(".thumbnail").on('click',function(){
    var dataUrl = $(this).attr('data-url');
    $("#show_main_image").attr('src',dataUrl);
  });
});