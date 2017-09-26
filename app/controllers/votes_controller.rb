class VotesController < ApplicationController
	include SessionsHelper
	def new
		@round = Round.find_by(open:true)
		if logged_in? 
			if @round && @round.votes.find_by(user_id: session[:user_id]) == nil
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
		@vote = @round.votes.create(vote_params)
		redirect_to pitches_path
	end

	private
  def vote_params
    params.require(:vote).permit!
  end
end
