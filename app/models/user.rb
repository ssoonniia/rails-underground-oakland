class User < ApplicationRecord
  has_many :events
  has_secure_password
  validates :username, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :username, uniqueness: true 
end
