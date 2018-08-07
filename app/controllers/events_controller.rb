class EventsController < ApplicationController

  def index
    @events = Events.all
  end

  def new
    @event = Event.new
  end

  def create
    if !logged_in
      redirect_to root_path
    end

    @event = Event.create(event_params)
    @event.user = current_user
    if !@event.save
      render :edit
    end
    @event.save
  end

  def show
    if !logged_in
      redirect_to root_path
    elsif !owner
      redirect_to events_path
    end
  end

  def destroy
  end


  def private
    params.require(:event).permit(:name, :date, :time, :location, :cost, :description_id, :user_id)
  end
end
