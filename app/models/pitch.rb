class Pitch < ApplicationRecord
	has_many :votes
	has_many :voters, through: :votes, source: :voter
	has_many :pitch_rounds
	has_many :rounds, through: :pitch_rounds
	belongs_to :creator, class_name: :User
	belongs_to :team

end
