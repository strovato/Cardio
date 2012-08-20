class UsersController < ApplicationController
  skip_before_filter :require_login, :only => [:new, :create]
  
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    @user.save
    user = User.find_by_name(params[:user][:name])
    cookies.signed[:user_id] = user.id
    redirect_to decks_path
  end
  
  
  
end