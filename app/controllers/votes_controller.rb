class VotesController < ApplicationController
	def new
		@round_1_pitches = Round.first.pitches
		# @round_2_pitches = Round.second.pitches
	end

	def create
		
	end
end
