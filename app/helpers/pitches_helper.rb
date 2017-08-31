module PitchesHelper
	def open_round_1_button
		to_open_round = Round.find_by(round_number: 1)
		to_open_round.update(open: true)
		to_close_round = Round.find_by(round_number: 2)
		to_close_round.update(open: false)
	end

	def open_round_2_button
		to_open_round = Round.create(round_number: 2, open: true)
		to_close_round = Round.find_by(round_number: 1)
		to_close_round.update(open: false)
	end

	def close_rounds_button
		round_1 = Round.find_by(round_number: 1)
		round_1.update(open: false)
		round_2 = Round.find_by(round_number: 2)
		round_2.update(open: false)
	end
end
