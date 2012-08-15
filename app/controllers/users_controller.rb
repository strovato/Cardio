class UsersController < ApplicationController
  def new
    @user = User.new
    cookies.delete :user_id
  end
  
  def create
    @user = User.new(params[:user])
    @user.save
    redirect_to sign_in_path
  end
end