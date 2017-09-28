class Round < ApplicationRecord
	has_many :pitches, dependent: :destroy
	has_many :votes

end
