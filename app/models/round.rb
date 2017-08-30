class Round < ApplicationRecord
	has_many :pitch_rounds
	has_many :pitches, through: :pitch_rounds
end
