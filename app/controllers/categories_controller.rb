class CategoriesController < ApplicationController
  before_action :authenticate_admin!
  
  def new
    @new_category = Category.new
  end

  def create
    @new_category = Category.new(params_category)
    return successful_create if @new_category.save
    return render :new if !@new_category.save
  end

  private

  def successful_create
    redirect_to new_category_path
    flash[:notice] = "Categoria #{@new_category.name} \n
                      cadastrada com sucesso!"
  end

  def params_category
    params.require(:category).permit(:name)
  end
end
