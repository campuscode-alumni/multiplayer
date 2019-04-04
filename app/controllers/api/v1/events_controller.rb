class Api::V1::EventsController < Api::V1::ApplicationController

  def index
    @events = Event.all
    render status: 200, json: @events
  end

  def show
    @event = Event.find_by(id: params[:id])
    render status: 200, json: @event if @event
    render status: 404, json: 'Não existe um evento com o ID informado'
  end
end