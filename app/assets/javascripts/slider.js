$(document).on('turbolinks:load', function(){
  $('.slick').slick({
    autoplay:true, 
    autoplaySpeed: 5000,
    pauseOnFocus: false,
    dots:true,     
  });
});

$('#target').slick({
  autoplay: true,
  autoplaySpeed: 5000,
  pauseOnFocus: false,
  pauseOnHover: false,
  pauseOnDotsHover: false,
});