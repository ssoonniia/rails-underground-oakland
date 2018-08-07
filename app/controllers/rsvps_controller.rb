class RsvpsController < ApplicationController
  include ApplicationHelper

  def new
    @event = Event.find_by_id(params[:event_id])
    @user = current_user
    @rsvp = Rsvp.create(user_id: @user.id, event_id: @event.id)
  end

  def create

  end

  def destroy
  end
end
