class CategoriesController < ApplicationController
  def index
    @categories = Category.order("id ASC").limit(13)

  end

  def show
    @selected_category = Category.find(params[:id])
  end
end
