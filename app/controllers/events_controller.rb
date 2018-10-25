class EventsController < ApplicationController
  before_action :logged_in?, only: [:new, :index, :create, :cheap]
  before_action :set_event, only: [:show, :edit, :update, :destroy, :cheap]
  before_action :set_user, only: [:new, :create, :edit, :index, :show, :cheap]
  before_action :authorized_to_edit?, only: [:show, :edit, :update]

  def index
    if !params[:date].blank?
      if params[:date]== 'Today Events'
        @events = Event.all.todays_events
      elsif params[:date] == 'Old Events'
        @events = Event.all.past_events
      else
        @events = Event.all.future_events
      end
    else
      @events = Event.all
    end
    @cheap = Event.cheapest
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)
    @event.user_id = @user.id
    if @event.save
      respond_to do |f|
        f.html {redirect_to event_path(@event)}
        f.json {render :json => @event}
      end
    else
      render :new
    end
  end



  def show
    @rsvps = @event.rsvps
    @user_events = @user.events
    # respond_to :html, :json
    respond_to do |format|
      format.html
      format.json {render :json => @event}
    end
    # render :json => @event
  end

  def edit
  end

  def update
    @event.update(event_params)
    redirect_to event_path(@event)
  end

  def destroy
    @event.delete
    flash[:info] = "Event has been deleted"
    redirect_to events_path
  end



private

  def event_params
    params.require(:event).permit(:name, :date, :time, :location, :cost, :description, :user_id)
  end

  def authorized_to_edit?
    if !logged_in? || !owner?
      flash[:danger] = 'You are not authorized to edit'
      redirect_to events_path
    end
      true
  end

end
