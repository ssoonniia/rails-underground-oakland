class RsvpsController < ApplicationController
  before_action :set_user, only: [:new, :create, :show, :destroy]
  before_action :logged_in?, only: [:new, :create, :show, :destroy]
  before_action :set_event, only: [:new, :create, :show]

  def new
    @rsvp= Rsvp.new
  end

  def create
    @events = Event.all
     if current_rsvp.include?(@user.id)
       flash[:info] = "You've already RSVP to this event. You're all set!"
       redirect_to events_path
     else
       @rsvp = Rsvp.create(user_id: @user.id, event_id: @event.id, guests: params[:rsvp][:guests])
       @rsvp.save
       flash[:success] = "Sweet! Thanks for your RSVP!"

       redirect_to events_path
     end
  end

  def show
    @rsvps = @event.rsvps
  end

  def destroy
    @rsvp = Rsvp.find_by_id(params[:id])
    @rsvp.destroy
    flash[:info] = "Thank you for your update"
    redirect_to events_path
  end


  private

  def current_rsvp
    @event.rsvps.collect do |rsvp|
      rsvp.user_id
    end
  end

end
