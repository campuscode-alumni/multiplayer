class Api::V1::GamesController < Api::V1::ApplicationController
  def index
    @games = Game.all
    render status: :ok, json: @games
  end

  def destroy
    @game = Game.find_by(id: params[:id])
    if @game
      @game.destroy
      render status: :ok, json: "Game #{@game.name} deletado com sucesso"
    else
      render status: :not_found, json: 'Game não existe'
    end
  end
end
