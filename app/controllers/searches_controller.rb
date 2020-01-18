class SearchesController < ApplicationController
  before_action :set_ransack

  def index
    @search_item = Item.ransack(params[:q]) 
    @items = @search_item.result.page(params[:page])
    @category = Category.order("id ASC").limit(13)
  end

  def category_children
    @category_children = Category.find(params[:category_value]).children
  end

  def category_grandchildren
    @category_grandchildren = Category.find(params[:category_value]).children
  end

  private

  def set_ransack
    @q = Item.ransack(params[:q])
  end

end