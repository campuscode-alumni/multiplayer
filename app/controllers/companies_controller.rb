class CompaniesController < ApplicationController
  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      flash[:notice] = "Empresa #{@company.name} cadastrada com sucesso!"
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def company_params
    params.require(:company).permit(:name, :logo)
  end
end