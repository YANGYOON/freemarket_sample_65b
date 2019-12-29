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
    @item = Item.new(item_params)
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

  private
  def item_params
    params.require(:item).permit(:name, :price, :category_id, images_attributes: [:image])
  end

  def set_product
    @item = Item.find(params[:id])
  end
end
