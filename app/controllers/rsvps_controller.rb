class RsvpsController < ApplicationController
  before_action :set_user, only: [:new, :create, :show, :destroy]
  before_action :logged_in?, only: [:new, :create]

  def new
    @rsvp= Rsvp.new
    @event = Event.find_by_id(params[:event_id])
  end

  def create
    @events = Event.all
    @event = Event.find_by_id(params[:event_id])
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
    @event = Event.find_by_id(params[:event_id])
    @rsvps = @event.rsvps
  end

  def destroy
    @rsvp = Rsvp.find_by_id(params[:id])
    @rsvp.destroy
    flash[:info] = "Thank you for your update"
    redirect_to events_path
  end


  private


# how to get this to work  - can't get @user and @event_id to work correctly tried user_id: @user.id
  def rsvp_params
    params.require(:rsvp).permit(:user_id, :event_id , :guests)
  end

  def current_rsvp
    @event.rsvps.collect do |rsvp|
      rsvp.user_id
    end
  end

end
