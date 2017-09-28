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
    @user = User.find(session[:user_id])

    pitch_params[:pitch_id].each do |pitch|
      @vote = Vote.create(round_id: @round.id, user_id: @user.id, pitch_id: pitch)
    end 
    if @vote.save
      redirect_to pitches_path
    end
	end

	private
  def pitch_params
    params.require(:vote).permit(:pitch_id, :pitch_id => [])
  end
end
