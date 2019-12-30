$(function(){
  function calSalesCommission(price){
    html = `<div class="contents__main__price__right__box__fee__right__num">
              ${price.sales_commission}
            </div>`;
    $('.contents__main__price__right__box__fee__right').append(html)
  }
  function calProfit(price){
    html = `<div class="contents__main__price__right__box__profit__right__num">
              ${price.profit}
            </div>`;
    $('.contents__main__price__right__box__profit__right').append(html)
  }



  $(document).on('change', '#price__form' ,function(){
    console.log(document.getElementById('price__form'))
    price = document.getElementById('price__form').value
    $.ajax ({
      url: 'cal_profit',
      type: 'GET',
      data: { price: price },
      dataType: 'json'
    })
    .done(function(price){
      $(document).on('change', '#price__form', function(){
        $('.contents__main__price__right__box__profit__right__num').remove(); 
        $('.contents__main__price__right__box__fee__right__num').remove();
      })
      calSalesCommission(price);
      calProfit(price);
  })
});
});