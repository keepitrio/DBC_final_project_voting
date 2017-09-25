class Pitch < ApplicationRecord
	has_many :votes
	has_many :voters, through: :votes, source: :voter
	belongs_to :round
	belongs_to :student, class_name: :User, foreign_key: :user_id, optional: true
	has_one :team

	validates :user_id, presence: true
end
