class ItemsController < ApplicationController
  include ApplicationHelper
  before_action :set_item, only: [:edit, :update, :destroy]
  before_action :set_ransack
  def index
    @trend_categories = Item.group(:root_category_id).order('count_all DESC').limit(5).count.to_a
    @trend_categories_ids = []
    @trend_categories.each_with_index do |trend_category, i|
      @trend_categories_ids = @trend_categories_ids.push(trend_category[0])
    end

    @trend_categories_data = []
    @trend_categories_ids.each do |category_id|
      @trend_categories_data = @trend_categories_data.push(Category.find(category_id))
    end
  end

  def new
    @item = Item.new
    @item.images.new
    @item.build_shipping
    @category = Category.order("id ASC").limit(13)
  end

  def create
    if params[:item][:images_attributes] != nil
      @item = Item.new(item_params.merge(seller_id: current_user.id))
      if @item.save
        redirect_to root_path
      else
        @category = Category.order("id ASC").limit(13)
        redirect_to action: 'new'
      end
    else
      @category = Category.order("id ASC").limit(13)
      redirect_to action: 'new'
    end
  end

  def search

    @items =  Item.search(params[:keyword])
    @category = Category.order("id ASC").limit(13)
    @size = Size.order("id ASC").limit(9)
  end

  def detail_search
    @brand_data = Brand.find_by(name: params[:q][:brand_id_cont])
    if @brand_data != nil
      @brand_data_id = @brand_data.id
    else
      @brand_data_id = nil
    end
    if params[:q] != nil
      @search = Item.ransack(search_params.merge(brand_id_eq: @brand_data_id))
      @details = @search.result(distinct: true)
    else
      params[:q] = { sorts: 'id desc' }
      @search = Item.ransack()
    end 
  end


  def buy
  end

  def show
    @item = Item.find(params[:id])
    @items = Item.where(seller_id: @item.seller_id, level: 0 ).includes(:images).order('created_at DESC').limit(7)
    @same_category_items = Item.where(category_id: @item.category_id, level: 0).includes(:images).order('created_at DESC').limit(6)
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
  end 

  def edit
    if  @item.seller_id != current_user.id
      redirect_to action: 'show'
    end
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
    if  @item.seller_id == current_user.id
      if @item.update(item_params)
        redirect_to root_path
      else
        redirect_to action: 'edit'
      end
    else 
      redirect_to item_path(@item)
    end
  end

  def destroy
    if  @item.seller_id == current_user.id
      if @item.destroy
        redirect_to root_path
      else
        redirect_to action: 'edit'
      end
    else
      redirect_to item_path(@item)
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



  def show_selling_items
    @items = Item.where(seller_id: current_user.id, level: 0).includes(:images).order('created_at DESC')
  end

  def show_transactions
    @items = Item.where(seller_id: current_user.id, level: 1).includes(:images).order('created_at DESC')
  end

  def show_sold_items
    @items = Item.where(seller_id: current_user.id, level: 2).includes(:images).order('created_at DESC')
  end

  private

  def item_params
    params.require(:item).permit(:id, :name, :price, :state, :condition, :root_category_id, :category_id, :size_id, :brand_id,
                                  images_attributes: [:id, :image, :_destroy], 
                                  shipping_attributes: [:method, :prefecture_from, :period_before_shopping, :fee_burden])
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_ransack
    @q = Item.ransack(params[:q])
  end

  def search_params
    params.require(:q).permit(:comdition_in , :sorts , :name_cont, :price_gteq, :price_lteq)
  end

end
