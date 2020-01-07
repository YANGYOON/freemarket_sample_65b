class CategoriesController < ApplicationController
  def index
    @categories = Category.order("id ASC").limit(2)

  end

  def show
  
  end
end
