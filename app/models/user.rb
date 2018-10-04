class User < ApplicationRecord
  has_many :events
  has_many :rsvps
  has_many :attending_events, :through => :rsvps, :source => :event

  validates :username, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :username, uniqueness: true

  has_secure_password
end
