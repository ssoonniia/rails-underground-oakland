class UserSerializer < ActiveModel::Serializer
  attributes :id
  has_many :events
  has_many :rsvps
end
