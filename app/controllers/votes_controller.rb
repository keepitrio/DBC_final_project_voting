class VotesController < ApplicationController
	def new
		@pitches = Round.where(open:true)[0].pitches
	end

	def create

	end
end
