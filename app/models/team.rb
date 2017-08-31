class Team < ApplicationRecord
  belongs_to :pitch, optional: true
  has_many :students, class_name: :User
  validates :pitch, uniqueness: true
    # validates :voter, {presence: true, uniqueness: {scope: :pitch}
    
end
