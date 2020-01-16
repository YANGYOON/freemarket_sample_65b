class AdminController < ApplicationController
  before_action :if_not_admin, only:[:index, :users_show, :items_show, :user_destroy, :item_destroy, :trading_show]

  def index
  end

  def users_show
    @users = User.all.page(params[:page]).per(5).order("created_at DESC")
  end

  def items_show
    @items = Item.includes(:images).page(params[:page]).per(10).order('created_at DESC')
  end

  def trading_show
    @items = Item.includes(:images).page(params[:page]).per(10).order('created_at DESC')
  end

  def user_destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_show_admin_index_path
  end

  def item_destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_show_admin_index_path
  end



  private
  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end

end
