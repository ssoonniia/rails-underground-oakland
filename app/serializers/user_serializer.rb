class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :attending_events
  has_many :events
  has_many :rsvps
  has_many :attending_events, :through => :rsvps, :source => :event
end
