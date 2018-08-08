class RsvpsController < ApplicationController


  def new
    @event = Event.find_by_id(params[:event_id])
    @user = current_user
    @rsvp = Rsvp.create(user_id: @user.id, event_id: @event.id)
  end

  def create

  end

  def destroy
    @rsvp = Rsvp.find_by_id(params[:id])
    @rsvp.delete

    redirect_to events_path
  end
end
