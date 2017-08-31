class Vote < ApplicationRecord
  belongs_to :voter, class_name: :User, foreign_key: :user_id
  belongs_to :pitch, optional: true 
  validates :voter, {presence: true, uniqueness: {scope: :pitch}}
end
