class GamesController < ApplicationController
  before_action :authenticate_admin!

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      flash[:notice] = "Jogo #{@game.name} cadastrado com sucesso"
      redirect_to new_game_path
    else
      render :new
    end
  end

  private

  def game_params
    params.require(:game).permit(:name, :release_year, :photo)
  end
end