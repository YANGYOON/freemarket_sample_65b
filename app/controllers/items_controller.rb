class ItemsController < ApplicationController
  def index
    @items = Item.includes(:images).order('created_at DESC')
    # @items = @item.category.includes(:category)
  end

  def new
    @item = Item.new
    @item.images.new
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

  private
  def item_params
    params.require(:item).permit(:name, :price, :category_id, images_attributes: [:image])
  end

  def set_product
    @item = Item.find(params[:id])
  end
end
