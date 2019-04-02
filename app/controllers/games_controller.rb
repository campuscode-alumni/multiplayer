class GamesController < ApplicationController
  before_action :authenticate_admin!

  def new
    @game = Game.new
    @categories = Category.all
    @platforms = Platform.all
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      successfull_save
    else
      @categories = Category.all
      @platforms = Platform.all
      render :new
    end
  end

  private

  def successfull_save
    @game.category_games = category_games_params
    @game.game_platforms = game_platforms_params
    flash[:notice] = "Jogo #{@game.name} cadastrado com sucesso"
    redirect_to new_game_path
  end

  def game_params
    params.require(:game).permit(:name, :release_year, :photo)
  end

  def category_games_params
    CategoryGame.where(id: params[:game][:category_games][:category_games_ids])
  end

  def game_platforms_params
    GamePlatform.where(id: params[:game][:game_platforms][:game_platforms_ids])
  end
end
