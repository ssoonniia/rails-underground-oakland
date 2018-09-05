class RsvpsController < ApplicationController
  before_action :set_user, only: [:new, :show, :destroy]
  before_action :logged_in?, only: [:new, :create]



  def new
    @events = Event.all
    @event = Event.find_by_id(params[:event_id])
    @rsvp = Rsvp.create(user_id: @user.id, event_id: @event.id)
  end

  def create
  end

  def destroy
    @rsvp = Rsvp.find_by_id(params[:id])
    @rsvp.destroy
    redirect_to user_path
  end
end
