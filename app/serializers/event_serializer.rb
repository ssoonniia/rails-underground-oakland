class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :date, :time, :location, :cost, :description
  belongs_to :user
  has_many :rsvps
  has_many :attending_users, through: :rsvps, :source => :user
end
