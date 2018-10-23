class RsvpSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :user
  belongs_to :event
end
