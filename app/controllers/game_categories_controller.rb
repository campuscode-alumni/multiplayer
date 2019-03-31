class GameCategoriesController < ApplicationController
  def new
    @new_game_category = GameCategory.new
  end

  def create
    @new_game_category = GameCategory.new(params_category)
    return successful_create if @new_game_category.save
  end

  private

  def successful_create
    redirect_to new_game_category_path
    flash[:notice] = "Categoria #{@new_game_category.name} \n
                        cadastrada com sucesso!"
  end

  def params_category
    params.require(:game_category).permit(:name)
  end
end
