class RoundsController < ApplicationController
  include RoundsHelper 
  include SessionsHelper

  def index 
    if logged_in?
      if admin?
        @open_round = Round.find_by(open: true)
        @round = Round.last
        @pitches = Pitch.all
      else 
        redirect_to pitches_path
      end 
    else 
      redirect_to login_path
    end
  end 

  def show 
    if logged_in? 
      if admin?
        @round = Round.find(params[:id])
        @penultimate_round = Round.second_to_last
        @new_round = Round.last
        if @penultimate_round == nil 
          @pitches = @round.pitches
        elsif @new_round.open == true 
          @pitches = @round.pitches 
        elsif @new_round.id != @round.id 
          @pitches = @round.pitches + @new_round.pitches
        else
          @pitches = @round.pitches
        end
      else
        redirect_to pitches_path, notice: "You do not have permission to access this page."
      end
    else
      redirect_to login_path, notice: "Please log in."
    end
  end

  def create_round
    @round = Round.new 
    if @round.save
      redirect_to rounds_path
    end
  end

  def begin_selection
    @round = Round.find(params[:id])
    @new_round = Round.new 
    if @new_round.save
      redirect_to round_path(@round)
    end
  end

  def open_round 
    @round = Round.last
    update_round
    redirect_to rounds_path
  end 

  def close_round
    update_to_close_round
    redirect_to rounds_path
  end

  def finalize_pitches
    @round = Round.last
    @pitches = @round.pitches
  end 


end

