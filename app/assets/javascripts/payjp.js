$(document).on('turbolinks:load', function() {
  var form = $("#charge-form");
  Payjp.setPublicKey('');

  $("#charge-form").on("click", "#submit-button", function(e) {
    e.preventDefault();
    form.find("input[type=submit]").prop("disabled", true);
    var card = {
        number: parseInt($("#payment_card_no").val()),
        cvc: parseInt($("#payment_card_security_code").val()),
        exp_month: parseInt($("#payment_card_expire_mm").val()),
        exp_year: parseInt($("#payment_card_expire_yy").val()),
    };
    
    Payjp.createToken(card, function(s, response) {
      if (response.error) {
        alert("error")
        form.find('button').prop('disabled', false);
      }
      else {
        $(".credit_contet__input").removeAttr("name");
        $(".credit_content__form__input").removeAttr("name");
        $(".select-default").removeAttr("name");

        var token = response.id;
        console.log(token);
        $("#charge-form").append($('<input type="hidden" name="payjp-token" class="payjp-token" />').val(token));
        $("#charge-form").get(0).submit();
      }
    });
  });
});