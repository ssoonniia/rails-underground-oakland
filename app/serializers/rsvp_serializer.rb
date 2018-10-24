class RsvpSerializer < ActiveModel::Serializer
  attributes :id, :guests
  belongs_to :user
  belongs_to :event
end
