class ItemsController < ApplicationController
  def index
    @items = Item.includes(:images).order('created_at DESC')
  end

  def new
    @item = Item.new
    @item.images.new
    @category = Category.all.order("id ASC").limit(13)
  end

  def create
    @brand_data = Brand.find_by(name: params[:item][:brand])
    if @brand_data != nil
      @brand_id = Brand.find_by(name: params[:item][:brand]).id
    else
      @brand_id = nil
    end
    
    @item = Item.new(item_params.merge(brand_id: @brand_id))
    
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def buy
  end

  def show
  end

  def category_children
    @category_children = Category.find(params[:category_value]).children
  end
  # Ajax通信で送られてきたデータをparamsで受け取り､childrenで子を取得

  def category_grandchildren
    @category_grandchildren = Category.find(params[:category_value]).children
  end

  def set_sizes
    @set_sizes = Size.where(classification: params[:parents_category_value])
  end

  def cal_profit
    @price = params[:price].to_i
    @sales_commission = @price * 0.1
    @profit = @price * 0.9
  end

  private
  def item_params
    params.require(:item).permit(:name, :price, :category_id, images_attributes: [:image])
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
