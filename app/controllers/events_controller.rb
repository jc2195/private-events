class EventsController < ApplicationController
  before_action :require_login

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.new(event_params)
    @event.save
    redirect_to event_path(@event.id)
  end

  def show
    @event = Event.find(params[:id])
  end

  def index
    @events = Event.all
  end

  def update
    @event = Event.find(params[:id])
    if @event.attendees.exists?(session[:current_user_id])
      flash[:notice] = "You are already attending #{@event.title}!"
    else
      @event.attendees << User.find(session[:current_user_id])
      flash[:notice] = "You have been marked as attending #{@event.title}"
    end
    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :creator_id, :date, :location)
  end

  def require_login
    unless signed_in?
      redirect_to new_session_url
    end
  end
end
