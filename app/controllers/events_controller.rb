class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.new(event_params)
    @event.save
    redirect_to event_path(@event.id)
  end

  def show
    @event = Event.where(creator_id: session[:current_user_id]).last
  end

  def index
    @events = Event.all
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :creator_id)
  end
end
