class RoundsController < ApplicationController
  include RoundsHelper 

  def create_round
    @round = Round.new 
    if @round.save
      redirect_to users_path
    end
  end

  def open_round 
    @round = Round.last
    update_round
    redirect_to users_path
  end 

  def close_round
    update_to_close_round
    redirect_to users_path
  end

  def move_to_next_round
    pitch.update_attributes(round_id: Round.last.id)
    redirect_to users_path
  end 

end

