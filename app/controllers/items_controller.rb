class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
    @item.images.new
  end

  def buy
  end

  def show
    @item = Item.find(params[:id])
  end 
  
end
