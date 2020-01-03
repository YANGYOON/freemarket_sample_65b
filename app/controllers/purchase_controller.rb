class PurchaseController < ApplicationController

  require 'payjp'

  def buy
    @item = Item.find(params[:item_id])
    @image = Image.find(params[:item_id])
    @address = Address.find_by(user_id: current_user.id)
  end

  def pay
    @item = Item.find(params[:item_id])
    Payjp.api_key = ""
    Payjp::Charge.create(
      amount: @item.price,
      card: params['payjp-token'],
      currency: 'jpy'
    )
  end



  private
  def item_params
    params.require(:item).permit(:name, :price)
  end

  def image_params
    params.require(:image).permit(:image)
  end
end
