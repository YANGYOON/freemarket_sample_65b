class CategoriesController < ApplicationController
  def index
    @categories = Category.order("id ASC").limit(13)

  end

  def show
    @searched_category = Category.find(params[:id])
    @result_items = @searched_category.search
  end
end
