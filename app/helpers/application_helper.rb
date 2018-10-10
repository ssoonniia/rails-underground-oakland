module ApplicationHelper

  def dispaly_date(event)
    event.date.strftime('%B %d, %Y')
  end

  def display_time(event)
    event.time.strftime("%I:%M %p")
  end

  def future_event?(event)
    Event.all.future_events.include?(event)
  end

end
