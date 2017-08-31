class UsersController < ApplicationController
  include SessionsHelper

  def show 
    @user = User.find(params[:id])
  end 

  def new 
    @user = User.new
  end 

  def create
    @user = User.new(user_params)
    @user.password = params[:user][:password]
    if @user.save
      session[:user_id] = @user.id
      redirect_to pitches_path
    else 
      render 'new'
    end
  end 

  def destroy 
    @user.destroy
    redirect_to_user_path
  end 

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end 

end