class Round < ApplicationRecord
	has_many :pitch_rounds
	has_many :pitches, through: :pitch_rounds
	has_many :votes

	validates :round_number, uniqueness: true
end
