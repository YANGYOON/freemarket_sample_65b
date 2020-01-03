$(function(){
  function appendOption(category){ // optionの作成
    var html = `<option value="${category.id}">${category.name}</option>`;
    return html;
  }
  function appendChidrenBox(insertHTML){ // 子セレクトボックスのhtml作成
    var childSelectHtml = '';
      childSelectHtml = `<div class='item-select-wrapper' id= 'children_wrapper'>
                          <div class='contents__main__detail__right__select'>
                            <select class="contents__main__detail__right__select__form" id="child_category" required="required" name="item[category_id]">
                              <option value="">---</option>
                              ${insertHTML}
                            </select>
                            <i class="fas fa-angle-down contents__main__detail__right__select--icon"></i>
                          </div>
                          <div class= 'item_select-grandchildren'>
                          </div>
                        </div>`;
    // 出現させるクラスの指定
    $('.item_select-children').append(childSelectHtml);
  }
  function appendgrandChidrenBox(insertHTML){ // 孫セレクトボックスのhtml作成
    var grandchildrenSelectHtml = '';
    grandchildrenSelectHtml = `<div class='item-select-wrapper' id= 'grandchildren_wrapper'>
                                <div class='contents__main__detail__right__select'>
                                  <select class="contents__main__detail__right__select__form" id="grandchild_category" required="required" name="item[category_id]">
                                    <option value="">---</option>
                                    ${insertHTML} 
                                  </select>
                                  <i class="fas fa-angle-down contents__main__detail__right__select--icon"></i>
                                </div>
                              </div>`;
    $('.item_select-grandchildren').append(grandchildrenSelectHtml);
  }
  function appendSizeBox(insertHTML){ // サイズセレクトボックスのhtml作成
    var sizeSelectHtml = '';
    sizeSelectHtml = `<div class='item-select-wrapper' id= 'set_sizes_wrapper'>
                                <div class="contents__main__detail__right__name">
                                  サイズ
                                  <div class="contents__main__detail__right__name--icon">
                                    必須
                                  </div>
                                </div>
                                <div class='contents__main__detail__right__select'>
                                  <select class="contents__main__detail__right__select__form" required="required" true name="item[size_id]">
                                    <option value="">---</option>
                                    ${insertHTML} 
                                  </select>
                                  <i class="fas fa-angle-down contents__main__detail__right__select--icon"></i>
                                </div>
                              </div>`;
    $('.item_select-size').append(sizeSelectHtml);
  }

  $(document).on('change', '#category_select', function(){  // 親セレクトボックスの選択肢を変えたらイベント発火
    // セレクトボックスのvalueを取得して、category_valueに代入
    var category_value = document.getElementById('category_select').value;
    //category_valueが空ではない場合のみAjax通信を行う｡選択肢を初期選択肢'---'に変えると､通信失敗となってしまうため｡
    console.log('category_children');
    if (category_value != ''){
      $.ajax({
        url: '/items/category_children',
        type: 'GET',
        data: { category_value: category_value },
        dataType: 'json'
      })
      .done(function(children){
        var insertHTML = '';
        children.forEach(function(child){  
        // forEachでchildに一つずつデータをinsertHTMLに代入｡子のoptionが一つずつ作成される
          insertHTML += appendOption(child); 
        });
        appendChidrenBox(insertHTML); 
        $(document).on('change', '#category_select', function(){
        // 親の選択肢を変えたら、子と孫とサイズを削除｡
          $('#children_wrapper').remove(); 
          $('#grandchildren_wrapper').remove();
          $('#set_sizes_wrapper').remove();
        })
      })
      .fail(function(){
        alert('カテゴリーの取得に失敗しました');
      })
    }
  });
  // document､もしくは親を指定しないと発火しない
  $(document).on('change', '#child_category', function(){
    var category_value = document.getElementById('child_category').value;
    if (category_value != ''){
      $.ajax ({
        url: '/items/category_grandchildren',
        type: 'GET',
        data: { category_value: category_value },
        dataType: 'json'
      })
      .done(function(grandchildren){
        $(document).on('change', '#child_category',function(){
          $('set_sizes_wrapper').remove();
        })
        var insertHTML = '';
        grandchildren.forEach(function(grandchild){
          insertHTML += appendOption(grandchild);
        });
        appendgrandChidrenBox(insertHTML);  
        $(document).on('change', '#child_category',function(){
          $('#grandchildren_wrapper').remove();
          $('#set_sizes_wrapper').remove();
        })
        $(document).on('change', '#grandchildren_wrapper',function(){
          $('#set_sizes_wrapper').remove();
        })
      })  
      .fail(function(){
        alert('カテゴリーの取得に失敗しました');
      })
    }
  });
  $(document).on('change', '#grandchild_category', function(){
    var parents_category_value = document.getElementById('category_select').value;
    if (parents_category_value == 1 || parents_category_value == 2 || parents_category_value == 3){
      $.ajax ({
        url: '/items/set_sizes',
        type: 'GET',
        data: { parents_category_value: parents_category_value },
        dataType: 'json'
      })
      .done(function(sizes){
        var insertHTML = '';
        sizes.forEach(function(size){
          insertHTML += appendOption(size);
        });
        appendSizeBox(insertHTML);  
        $(document).on('change', '#child_category',function(){
          $('#grandchildren_wrapper').remove();
          $('#set_sizes_wrapper').remove();
        })
      }) 
      .fail(function(){
        alert('サイズ取得に失敗しました');
      })
    }
  });
});