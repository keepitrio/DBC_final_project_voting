class Vote < ApplicationRecord
  belongs_to :voter, class_name: "User"
  belongs_to :pitch
  validates :voter, {presence: true, uniqueness: {scope: :pitch}}
end
