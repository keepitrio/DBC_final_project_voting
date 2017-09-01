class TeamsController < ApplicationController
  include SessionsHelper

  def index
    if logged_in 
    else 
      flash[:notice] = "You do not have access to this page."
      redirect_to login_path
    end 
  end

  def new
    if logged_in? && admin?
      @team = Team.new
      @users = User.all
      p @pitch_rounds = PitchRound.where(round_id: 2)
    else 
      flash[:notice] = "You do not have access to this page."
      redirect_to login_path
    end 
  end

  def create 
    @team = Team.new
    if @team.save 
      redirect_to teams_path
    else
      redirect_to users_path
    end
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
    else 
      flash[:notice] = "You do not have access to this page."
      redirect_to login_path
    end 
  end
end
