class PitchRoundsController < ApplicationController

  def move_to_round_2
    pitch = PitchRound.find_by(params[:pitch_id])
    pitch.update(round_id: 2)
    redirect_to users_path
  end

end
