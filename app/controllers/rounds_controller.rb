class RoundsController < ApplicationController
  include RoundsHelper 

  def open_round
    @round = Round.new 
    if @round.save
      update_round
      redirect_to users_path
    end
  end

  def close_round
    update_to_close_round
    redirect_to users_path
  end

end

