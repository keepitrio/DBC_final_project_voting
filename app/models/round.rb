class Round < ApplicationRecord
	has_many :pitches
	has_many :votes

end
