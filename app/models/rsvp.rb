class Rsvp < ApplicationRecord
  belongs_to :user
  belongs_to :event
  # validates :user_id, uniqueness: true
  # right now will not rsvp twice -- but will not create a bug -- add in error message. OH oh already rsvped to event
end
