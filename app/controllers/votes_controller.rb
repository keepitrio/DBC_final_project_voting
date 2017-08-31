class VotesController < ApplicationController
	def new
		open_round = Round.where(open:true)[0]
		if open_round
			@pitches = open_round.pitches
		else
			flash[:notice] = "Voting is not open at this time."
			redirect_to pitches_path
		end
	end

	def create

	end
end
