class VotesController < ApplicationController
	def new
		@vote = Vote.new
		open_round = Round.where(open:true)[0]
		if open_round
			@pitches = open_round.pitches
		else
			flash[:notice] = "Voting is not open at this time."
			redirect_to pitches_path
		end
	end

	def create
		@vote = Vote.new
		voted = []
		params[:round_votes].each do |k,v|
			voted << k if v == "1"
		end
		voted.each do |pitch_id|
			Vote.create(user_id: @current_user.id, pitch_id: pitch_id)
		end
		flash[:notice] = "Thanks for voting!"
		redirect_to @pitch
	end
end
