class VotesController < ApplicationController
	include SessionsHelper
	def new
		if logged_in?
			@open_round = Round.where(open:true)[0]
			if @open_round
				@pitches = @open_round.pitches
			else
				flash[:notice] = "Voting is not open at this time."
				redirect_to pitches_path
			end
		else 
      flash[:notice] = "You do not have access to this page."
      redirect_to login_path
    end 
	end

	def create
		@round = Round.find(params[:round_id])
		voted = params[:pitches]

		voted.each do |pitch_id|
			Vote.create!(user_id: current_user.id, pitch_id: pitch_id, round_id: @round.id)
		end
		
		flash[:notice] = "Thanks for voting!"
		redirect_to pitches_path
	end
end
