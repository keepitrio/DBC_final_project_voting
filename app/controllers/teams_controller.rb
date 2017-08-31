class TeamsController < ApplicationController
  include SessionsHelper

  def index
    if logged_in?
      @teams = Team.all
      render 'index'
    else 

      flash[:notice] = "You do not have access to this page."
      redirect_to login_path
    end
  end

  def new
    # if logged_in? && admin?
      @team = Team.new
    # else
    #   flash[:notice] = "You do not have access to this page."
    #   redirect_to login_path
    # end
  end

  def edit
    if logged_in? && admin?
    else
      flash[:notice] = "You do not have access to this page."
      redirect_to login_path
    end
  end

  def show
    if logged_in? 
      @team = Team.find(params[:id])
      render 'show'
    else 
      flash[:notice] = "You do not have access to this page."
      redirect_to login_path
    end
  end
end
