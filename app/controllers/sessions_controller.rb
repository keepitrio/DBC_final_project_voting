class SessionsController < ApplicationController
  include SessionsHelper

  def login
    if logged_in?
      redirect_to pitches_path
    end
  end

  def create
    @user = User.find_by(email: session_params[:email])

    if @user 
      if @user.authenticate(session_params[:password])
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
    else 
      @errors = ['Please register to access this site.']
      render 'login'
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to '/'
  end
  
  private 
    def session_params
      params.require(:session).permit(:email, :password)
    end
end
