class Api::V1::GamesController < Api::V1::ApplicationController
  def index
    @games = Game.all
    render status: 200, json: @games
  end

  def destroy
    @game = Game.find_by(id: params[:id])
    if @game
      @game.destroy
    else
      render status: 404, json: 'Game não existe'
    end
  end
end