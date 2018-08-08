class EventsController < ApplicationController
  before_action :authorized_to_edit?, only: [:show, :edit, :update, :destroy]
  before_action :logged_in?, only: [:new, :index, :create]
  before_action :set_event, only: [:show, :edit, :udpate, :destroy]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)
    @event.user_id = current_user.id
    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @event.update(event_params)
    redirect_to event_path(@event)
  end

  def destroy
    @event.delete
    redirect_to events_path
  end

private

  def event_params
    params.require(:event).permit(:name, :date, :time, :location, :cost, :description, :user_id)
  end
end

  def set_event
    @event = Event.find_by_id(params[:id])
  end
