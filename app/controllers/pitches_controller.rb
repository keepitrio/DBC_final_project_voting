class PitchesController < ApplicationController
  include SessionsHelper
  include PitchesHelper

  def index
    if logged_in?
      @pitches = Pitch.all
      @round = Round.find_by(open:true)
    else 
      redirect_to login_path
    end
  end 

  def new
    if logged_in?
      @pitch = Pitch.new
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

  private
  def pitch_params
    params.require(:pitch).permit(:title, :description)
  end


end

