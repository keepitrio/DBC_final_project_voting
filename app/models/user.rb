class User < ApplicationRecord

  validates :email, :name, presence: true
  validates :email, uniqueness: true
  has_secure_password

  belongs_to :team
  has_many :pitches
  has_many :votes
end
