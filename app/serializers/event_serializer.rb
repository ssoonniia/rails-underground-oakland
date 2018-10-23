class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :date, :time, :location, :cost
  belongs_to :user
  has_many :rsvps
end
