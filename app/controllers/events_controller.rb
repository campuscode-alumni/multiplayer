class EventsController < ApplicationController
  def new
    @event = Event.new
    @game_platforms = current_user.game_platforms
  end
end