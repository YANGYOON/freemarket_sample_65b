class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :destroy]

  def index
    @items = Item.includes(:images).order('created_at DESC').limit(20)
    @categories = Category.order("id ASC").limit(13)
  end

  def new
    @item = Item.new
    @item.images.new
    @item.build_shipping
    @category = Category.order("id ASC").limit(13)
  end

  def create
    # ブランドはstrでparamsにのってくるので、該当するbrand_idを探す
    @brand_data = Brand.find_by(name: params[:item][:brand])
    if @brand_data != nil
      @brand_id = Brand.find_by(name: params[:item][:brand]).id
    else
      @brand_id = nil
    end
    
    @item = Item.new(item_params.merge(brand_id: @brand_id, seller_id: current_user.id))
    if @item.save
      redirect_to root_path
    else
      @category = Category.order("id ASC").limit(13)
      redirect_to action: 'new'
    end
  end

  def buy
  end

  def show
    @item = Item.find(params[:id])
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
  end 

  def edit
    @category = Category.order("id ASC").limit(13)
    @selected_category = Category.find(@item.category_id)
    if @item.size_id != nil
      @selected_size = Size.find(@item.size_id)
      @selected_size_siblings = Size.where(classification: @selected_size.classification)
    end
    if @item.brand_id != nil
      @selected_brand = Brand.find(@item.brand_id)
      @selected_brand_siblings = Brand.where(classification: @selected_brand.classification)
    else
      @selected_brand = Brand.find(101)
      @selected_brand_siblings = Brand.where(classification: @selected_brand.classification)
    end
    
  end

  def update
    @brand_data = Brand.find_by(name: params[:item][:brand])
    if @brand_data != nil
      @brand_id = Brand.find_by(name: params[:item][:brand]).id
    else
      @brand_id = nil
    end

    if @item.update(item_params.merge(brand_id: @brand_id))
      redirect_to root_path
    else
      redirect_to action: 'edit'
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      redirect_to action: 'edit'
    end
  end

  def category_children
    @category_children = Category.find(params[:category_value]).children
  end

  def category_grandchildren
    @category_grandchildren = Category.find(params[:category_value]).children
  end

  def set_sizes
    @set_sizes = Size.where(classification: params[:parents_category_value])
  end

  def set_brands
    @set_brands = Brand.where(classification: params[:parents_category_value])
  end

  def cal_profit
    @price = params[:price].to_i
    @sales_commission = (@price * 0.1).to_i
    @profit = (@price * 0.9).to_i
  end

  def search
    @items =  Item.search(params[:keyword])
  end

  private
  def item_params
    params.require(:item).permit(:id, :name, :price, :state, :condition, :category_id, :size_id, :brand_id,
                                  images_attributes: [:id, :image, :_destroy], 
                                  shipping_attributes: [:method, :prefecture_from, :period_before_shopping, :fee_burden])
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
