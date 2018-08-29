module ApplicationHelper

  def dispaly_date(event)
    event.date.strftime('%B %d, %Y')
  end

  def display_time(event)
    event.time.strftime("%I:%M %p")
  end

end
