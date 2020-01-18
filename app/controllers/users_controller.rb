class UsersController < ApplicationController
  def index
  end

  def identification
    @user = User.find(params[:id])
  end

  def purchase
    @items = Item.where(buyer_id: current_user.id, level: 1).order('created_at DESC')
  end    
  
  def purchased
    @items = Item.where(buyer_id: current_user.id, level: 2).order('created_at DESC')
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

end