class HomeController < ApplicationController
  def index
    @games = Game.last(5)
    @events = Event.where('event_date >= ?', Time.zone.today).last(5)
  end
end
