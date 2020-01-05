class PurchaseController < ApplicationController
  before_action :get_payjp_info, only: [:pay]

  require 'payjp'

  def buy
    @item = Item.find(params[:item_id])
    @image = Image.find(params[:item_id])
    @address = Address.find_by(user_id: 1)
    @user = User.find_by(id: 1)
  end

  def pay
    @item = Item.find(params[:item_id])
    @creditcard = Creditcard.find_by(user_id: 1)
    Payjp::Charge.create(
      amount: @item.price,
      customer: @creditcard.customer_id,
      currency: 'jpy'
    )
    redirect_to root_path
  end

  private
  
  def get_payjp_info
      Payjp.api_key = ""
  end

end
