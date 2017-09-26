class SessionsController < ApplicationController
  include SessionsHelper

  def login
  end

  def create
    @user = User.find_by(email: params[:session][:email])

    if @user && @user.authenticate(params[:session][:password])
      login_user
      if logged_in? && admin?
        redirect_to rounds_path
      else 
        redirect_to pitches_path
      end
    else
      @errors = ['email or password is incorrect']
      render 'login'
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to '/'
  end
  
end
