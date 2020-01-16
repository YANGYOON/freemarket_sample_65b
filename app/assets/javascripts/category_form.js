$("#category_select").on("change",function(){

  var categoryValue = document.getElementById("category_select").Value;

  $.ajax({
    url: '/items/search',
    type: "GET",
    data: {
      category_select: categoryValue
    },
    datatype: 'json'
  })
})