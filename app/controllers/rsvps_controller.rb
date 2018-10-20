class RsvpsController < ApplicationController
  before_action :set_user, only: [:new, :create, :index, :destroy]
  before_action :logged_in?, only: [:new, :create, :index, :destroy]
  before_action :set_event, only: [:new, :create, :index]

  def new
    @rsvp= Rsvp.new
  end

  def create
    @events = Event.all
     if @event.current_rsvp.include?(@user.id)
       flash[:info] = "You've already RSVP to this event. You're all set!"
       redirect_to events_path
     end
    @rsvp = Rsvp.create(user_id: @user.id, event_id: @event.id, guests: params[:rsvp][:guests])
      if @rsvp.save 
         flash[:info] = "Thanks for your RSVP"
         redirect_to events_path
      else
        render :new
    end
  end

  def index
    @rsvps = @event.rsvps
  end

  def destroy
    @rsvp = Rsvp.find_by_id(params[:id])
    @rsvp.destroy
    flash[:info] = "Thank you for your update"
    redirect_to events_path
  end

end
