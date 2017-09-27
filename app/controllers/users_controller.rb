class UsersController < ApplicationController
  include SessionsHelper

  def new 
    @user = User.new
  end 

  def create
    @user = User.new(user_params)
    @user.password = params[:user][:password]
    if @user.save
      login_user
      redirect_to pitches_path
    else 
      render 'new'
    end
  end 
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end 

end