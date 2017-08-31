module PitchesHelper
	def open_round_1
		round = Round.find_by(round_number: 1)
		round.update(open: true)
	end

	def open_round_2
		round = Round.find_by(round_number: 2)
		round.update(open: true)
	end
end
