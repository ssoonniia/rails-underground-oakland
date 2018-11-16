class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :date, :time, :location, :cost, :description, :display_date, :display_time, :attending_users, :user
  belongs_to :user
  has_many :rsvps
  has_many :attending_users

  def display_date
    self.object.date.strftime('%B %d, %Y')
  end

  def display_time
    self.object.time.strftime("%I:%M %p")
  end

end
