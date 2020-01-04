class CreditcardsController < ApplicationController

  require 'payjp'

  def index
  end

  def new
    @creditcard = Creditcard.new
  end

  def create
    Payjp.api_key = ''

    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
        # email: current_user.email,
        card: params['payjp-token'],
      )
      @creditcard = Creditcard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      
      if @creditcard.save
        redirect_to action: "index"
      else
        redirect_to action: "create"
      end
    end
  end
  
end
