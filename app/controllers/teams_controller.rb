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
      @users = User.all
      @teams = Team.all
    else
      flash[:notice] = "You do not have access to this page."
      redirect_to login_path
    end
  end

  def create
    if logged_in? && admin?
      @team = Team.new(:pitch_id => id_params)
      if @team.save
        @pitch = Pitch.find(id_params)
        @pitch.update_attributes(team_id: @team.id)
        redirect_to finalize_pitches_path
      else
        flash[:notice] = "The team did not get saved"
        redirect_to finalize_pitches_path
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

  def assign_users
    user_id_params.each do |user_id|
      user = User.find(user_id) 
      user.update_attributes(team_id: user_params[:team_id])
    end
    redirect_to new_team_path
  end


  private
    def user_id_params
      params.require(:user_id)
    end

    def id_params
      params.require(:pitch_id)
    end

    def user_params
      params.require(:user).permit(:team_id)
    end
    
end


