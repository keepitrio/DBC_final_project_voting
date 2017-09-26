class VotesController < ApplicationController
	include SessionsHelper
  include RoundsHelper

	def new
		@round = Round.find_by(open:true)
		if logged_in? 
			if @round && !voted?(@round)
				@pitches = @round.pitches
				@vote = Vote.new
			else
				redirect_to pitches_path
			end
		else 
      flash[:notice] = "You do not have access to this page."
      redirect_to login_path
    end 
	end

	def create
		@round = Round.find(params[:round_id])
    p "***********"
    p @round
		@vote = Vote.create(vote_params)
    p @vote
    p"******"
    p vote_params
    if @vote.save
		  redirect_to pitches_path
    end
	end

	private
  def vote_params
    params.require(:vote).permit(:round_id, :pitch_id, :user_id)
  end
end
