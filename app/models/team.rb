class Team < ApplicationRecord
  belongs_to :pitch
  has_many :students, class_name: "User"
end
