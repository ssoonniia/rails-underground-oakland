class Event < ApplicationRecord
  belongs_to :user
  has_many :rsvps
  has_many :attending_users, through: :rsvps, :source => :user

  validates :name, presence: true
  validates :date, presence: true
  validates :location, presence: true
  validates :cost, presence: true
  validates :description, presence: true
  scope :todays_events,  -> {where('date == ?', Date.today) }
  scope :past_events,  -> {where('date < ?',  Date.today)}
  scope :future_events,  -> {where('date >= ?', Date.today)}
  scope :cheapest, -> {(Event.order(cost: :asc).limit(1))}
  # scope :cheapest, -> {where('cost == ?', "Free")}

  def current_rsvp
    self.rsvps.collect do |rsvp|
      rsvp.user_id
    end
  end

end
