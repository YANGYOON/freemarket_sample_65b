$(document).on('turbolinks:visit', function () {
  var url = location.href ;
  if (url == "http://localhost:3000/") {
    location.reload();
  } 
});

$(document).on('turbolinks:visit', function () {
  var url = location.href ;
  if (url == "http://18.177.235.133/") {
    location.reload();
  } 
});