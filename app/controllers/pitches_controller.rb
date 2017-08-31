class PitchesController < ApplicationController

  def index
    @pitches = Pitch.all
    @round = Round.where(open:true)[0]
  end 

  def new
    @pitch = Pitch.new
  end 

  def create
    @pitch = Pitch.new(pitch_params)

    if @pitch.save
      redirect_to @pitch
    else
      render :new, status: 422
    end
  end

  private
  def pitch_params
    params.require(:pitch).permit(:title, :description)
  end
end

