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
    if logged_in? && admin?
      @team = Team.new
    else
      flash[:notice] = "You do not have access to this page."
      redirect_to login_path
    end
  end

  def create
    if logged_in? && admin?
      @team = Team.new(params[:team_details])
      if @team.save
        redirect_to teams_path
      else
        flash[:notice] = "The team did not get saved"
        render "new"
      end
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
