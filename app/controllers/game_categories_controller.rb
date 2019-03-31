class GameCategoriesController < ApplicationController
  def new
    @new_game_category = GameCategory.new
  end

  def create
    @new_game_category = GameCategory.new(params_category)
    if @new_game_category.save
      redirect_to new_game_category_path
      flash[:notice] = "Categoria #{@new_game_category.name} \n
                        cadastrada com sucesso!"
    end
  end

  private

  def params_category
    params.require(:game_category).permit(:name)
  end
end
