class Pitch < ApplicationRecord
	has_many :votes
	has_many :voters, through: :votes, source: :voter
	has_many :pitch_rounds
	has_many :rounds, through: :pitch_rounds
	belongs_to :student, class_name: :User, foreign_key: :user_id, optional: true
	has_one :team

end
