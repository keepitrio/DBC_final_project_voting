class UsersController < ApplicationController
  include SessionsHelper

  def index
    if logged_in?
      if admin?
        @pitches = Pitch.all
        @pitchrounds = PitchRound.all
      else 
        redirect_to pitches_path
      end 
    else 
      redirect_to login_path
    end 
  end 

  def new 
    @user = User.new
  end 

  def create
    @user = User.new(user_params)
    @user.password = params[:user][:password]
    if @user.save
      give_permission(@user)
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