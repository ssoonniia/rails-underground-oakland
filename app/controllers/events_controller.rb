class EventsController < ApplicationController
  before_action :authorized_to_edit?, only: [:show, :edit, :update, :destory]
  before_action :logged_in?, only: [:new, :index, :create]

  def index
    @events = Event.all
    # if !logged_in?
    #   redirect_to root_path
    # end
  end

  def new
    @event = Event.new
  end

  def create
    # if !logged_in?
    #   redirect_to root_path
    # end

    @event = Event.create(event_params)
    @event.user_id = current_user.id
    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def show
    @event = Event.find_by_id(params[:id])
    # #refractor
    # if !logged_in?
    #   redirect_to root_path
    # elsif !owner?
    #   redirect_to events_path
    # end
  end

  def edit
    @event = Event.find_by_id(params[:id])
    #refractor
    # if !logged_in?
    #   redirect_to root_path
    # elsif !owner?
    #   redirect_to events_path
    # end
  end

  def update
    @event = Event.find_by_id(params[:id])
    #refractor
    # if !logged_in?
    #   redirect_to root_path
    # elsif !owner?
    #   redirect_to events_path
    # end
    #
    @event.update(event_params)
    redirect_to event_path(@event)
  end

  def destroy
    @event = Event.find_by_id(params[:id])
    @event.delete
    redirect_to events_path
  end


  def event_params
    params.require(:event).permit(:name, :date, :time, :location, :cost, :description, :user_id)
  end
end
