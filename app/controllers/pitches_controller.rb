class PitchesController < ApplicationController
  include SessionsHelper
  include PitchesHelper

  def index
    if logged_in?
      @teams = Team.all
      @round = Round.last
      @pitches = Pitch.where(round_id: @round.id)
    else 
      redirect_to login_path
    end
  end 

  def new
    if logged_in?
      @pitch = Pitch.new
      @round = Round.last
    else 
      redirect_to login_path
    end 
  end 

  def create
    @pitch = Pitch.new(pitch_params)
    @pitch.user_id = current_user.id
    if @pitch.save
      @pitch.user_id = @current_user.id
      redirect_to pitches_path
    else
      render :new, status: 422
    end
  end

  def move_to_next_round
    @pitch = Pitch.find(id_params)
    @pitch.update_attributes(round_id: Round.last.id)
    @previous_round = Round.second_to_last
    redirect_to @previous_round
  end 


  private
  def pitch_params
    params.require(:pitch).permit(:title, :description, :round_id)
  end

  def id_params
    params.require(:pitch_id)
  end

end

