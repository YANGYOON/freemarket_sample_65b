class GraphsController < ApplicationController
  def index
    # @trend_categories = Item.joins(:category).group("categories.name").order('count_all DESC').count
    @trend_categories = Item.group(:category_id).count
  end
end
