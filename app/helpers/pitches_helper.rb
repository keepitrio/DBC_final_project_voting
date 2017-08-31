module PitchesHelper
	def open_round_1_button
		to_open_round = Round.find_by(round_number: 1)
		to_open_round.update(open: true)
		to_close_round = Round.find_by(round_number: 2)
		to_close_round.update(open: false)
	end

	def open_round_2_button
		to_open_round = Round.find_by(round_number: 2 )
		to_open_round.update(open: true)
		to_close_round = Round.find_by(round_number: 1)
		to_close_round.update(open: false)
	end
end
