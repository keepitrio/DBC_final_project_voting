class Team < ApplicationRecord
  belongs_to :pitch, optional: true
  has_many :students, class_name: "User"
end
