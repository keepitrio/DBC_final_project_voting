class Team < ApplicationRecord
  belongs_to :pitch, optional: true
  has_many :students, class_name: "User", foreign_key: :user_id
end
