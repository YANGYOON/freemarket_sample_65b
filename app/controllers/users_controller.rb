class UsersController < ApplicationController
  def index
  end

  def identification
    @user = User.find(params[:id])
  end
end