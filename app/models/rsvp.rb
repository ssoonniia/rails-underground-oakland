class Rsvp < ApplicationRecord
  belongs_to :user
  belongs_to :event
  validates :guests, presence: true



end
