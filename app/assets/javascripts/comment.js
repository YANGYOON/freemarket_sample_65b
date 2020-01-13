$( document ).on('turbolinks:load', function() {
  function buildHTML(comment){
    var html = 
    `<div class = "item-detail__contents__center__message-form__comments-sec">
       <div class = "item-detail__contents__center__message-form__comments-sec__left">
         <img class = "item-detail__contents__center__message-form__comments-sec__left__image" src = "/images/item.jpeg">
       </div>

       <div class = "item-detail__contents__center__message-form__comments-sec__right">
         <div class = "item-detail__contents__center__message-form__comments-sec__right__contents">
           <div class = "item-detail__contents__center__message-form__comments-sec__right__contents__user-name">
           ${comment.user_name}
           </div>

           <div class = "item-detail__contents__center__message-form__comments-sec__right__contents__comment">
             <div class = "item-detail__contents__center__message-form__comments-sec__right__contents__comment--text">
             ${comment.text}
             </div>

             <div class = "item-detail__contents__center__message-form__comments-sec__right__contents__comment--time">
             ${comment.date}
             </div>
           </div>
         </div>
       </div>
    </div>`
    return html;
  }
  
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false,
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.item-detail__contents__center__message-form').append(html);
      $('.item-detail__contents__center__message-form--form').val('');
      $('.item-detail__contents__center__message-form__submit--button').prop('disabled', false);
    })
    .fail(function(){
      alert('error');
    })
  })
})