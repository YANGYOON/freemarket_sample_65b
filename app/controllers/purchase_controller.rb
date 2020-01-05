class PurchaseController < ApplicationController
  before_action :redirect_to_credit_new, only: [:pay, :buy]
  before_action :get_payjp_info, only: [:pay, :buy]

  require 'payjp'

  def buy
    @item = Item.find(params[:item_id])
    @image = Image.find(params[:item_id])
    @address = Address.find_by(user_id: 1)
    @user = User.find_by(id: 1)

    customer = Payjp::Customer.retrieve(@creditcard.customer_id)
      @default_card_information = customer.cards.retrieve(@creditcard.card_id)
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

  def redirect_to_credit_new
    @creditcard = Creditcard.where(user_id: 1).first
    if @creditcard.blank?
      redirect_to controller: "creditcards", action: "new"
    end
  end

  def get_payjp_info
      Payjp.api_key = ""
  end

end
