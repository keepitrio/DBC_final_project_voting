class PitchesController < ApplicationController
  include SessionsHelper
  include PitchesHelper

  def index
    if logged_in?
      @pitches = Pitch.all
      @round = Round.where(open:true)[0]
    else 
      flash[:notice] = "You do not have access to this page."
      redirect_to login_path
    end
  end 

  def new
    if logged_in?
      @pitch = Pitch.new
    else 
      flash[:notice] = "You do not have access to this page."
      redirect_to login_path
    end 
  end 

  def create
    @pitch = Pitch.new(pitch_params)
    @pitch.user_id = current_user.id
    if @pitch.save
      redirect_to pitches_path
    else
      render :new, status: 422
    end
  end

  def show
    if logged_in?
      @pitch = Pitch.find(params[:id])
    else 
      flash[:notice] = "You do not have access to this page."
      redirect_to login_path
    end 
  end

  def open_round_1
    open_round_1_button
    redirect_to pitches_path
  end

  def open_round_2
    open_round_2_button
    redirect_to pitches_path
  end

  private
  def pitch_params
    params.require(:pitch).permit(:title, :description)
  end


end

