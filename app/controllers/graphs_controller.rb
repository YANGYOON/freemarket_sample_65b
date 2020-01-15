class GraphsController < ApplicationController
  def index
    @trend_categories_name = Item.joins(:category).group("categories.name").order('count_all DESC').limit(5).count.to_a
    @trend_categories_id = Item.group(:category_id).order('count_all DESC').limit(5).count.to_a
    @trend_brands_name = Item.joins(:brand).group("brands.name").order('count_all DESC').limit(5).count.to_a
  end
end
