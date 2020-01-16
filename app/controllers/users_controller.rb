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
end