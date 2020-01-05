class CreditcardsController < ApplicationController
  before_action :get_payjp_info, only: [:show, :create, :destroy]
  before_action :get_credit_info, only: [:show, :destroy]


  require 'payjp'

  def index
  end

  def new
    @creditcard = Creditcard.new
  end

  def show
    if @creditcard.blank?
      redirect_to controller: "creditcards", action: "new"
    else
      customer = Payjp::Customer.retrieve(@creditcard.customer_id)
      @default_card_information = customer.cards.retrieve(@creditcard.card_id)
    end
  end

  def create
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
        # email: current_user.email,
        card: params['payjp-token'],
      )
      @creditcard = Creditcard.new(user_id: 2, customer_id: customer.id, card_id: customer.default_card)
      
      if @creditcard.save
        redirect_to action: "show"
      else
        redirect_to action: "create"
      end
    end
  end

  def destroy
    customer = Payjp::Customer.retrieve(@creditcard.customer_id)
    customer.delete
    @creditcard.delete
    redirect_to action: "index"
  end

  private
  def get_payjp_info
    Payjp.api_key = ""
  end

  def get_credit_info
    @creditcard = Creditcard.where(user_id: 2).first
  end
  
end
