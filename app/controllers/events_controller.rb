class EventsController < ApplicationController
  def new
    @event = Event.new
    @game_platforms = current_user.game_platforms
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :game_platform_id,
      :event_date, :user_limit, :event_type, :event_location)
  end
end