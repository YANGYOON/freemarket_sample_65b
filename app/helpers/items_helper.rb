module ItemsHelper
  def search_new_items_category(root_category_id)
    root_category = Category.find(root_category_id)
    grandchildren_ids = root_category.indirect_ids
    new_items_category = Item.where(category_id: grandchildren_ids).order('created_at DESC').limit(20)
    if new_items_category[0] != nil
      sell_items_list = render partial: 'sell_items_list_top', locals: { root_category: root_category, items: new_items_category }
    else 
      sell_items_list = nil
    end
    return sell_items_list
  end
end