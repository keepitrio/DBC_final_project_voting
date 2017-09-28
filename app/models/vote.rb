class Vote < ApplicationRecord
  belongs_to :voter, class_name: :User, foreign_key: :user_id
  belongs_to :pitch, optional: true 
  belongs_to :round, optional: true

end
