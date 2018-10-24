class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email
  has_many :events
  has_many :rsvps
end
