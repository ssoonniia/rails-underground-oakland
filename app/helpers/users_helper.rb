module UsersHelper

  def has_events
    @user_events.size > 0
  end

  def has_rsvps
    @user.attending_events.size > 0
  end

  def future_rsvps(user)
    user.attending_events.collect do |event|
      if future_event?(event)
        event
      end
    end
  end


  def already_rsvp(user, event)
    user.attending_events.include?(event)
  end

end
