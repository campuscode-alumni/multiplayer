class CitiesController < ApplicationController
  def index
    state = State.find(params[:state_id])
    @cities = state.cities
    render 'cities', layout: false
  end
end
