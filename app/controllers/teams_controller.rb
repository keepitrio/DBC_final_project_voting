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
      @users = User.all
      @pitches = Round.last.pitches
    else
      flash[:notice] = "You do not have access to this page."
      redirect_to login_path
    end
  end

  def create
    if logged_in? && admin?
      p id_params
      p "***********"
      @team = Team.new(:pitch_id => id_params)
      p "***********"
      p id_params
      p @team
      if @team.save
        redirect_to new_team_path
      else
        flash[:notice] = "The team did not get saved"
        redirect_to new_team_path
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

  private
    def id_params
      params.require(:pitch_id)
    end
end


