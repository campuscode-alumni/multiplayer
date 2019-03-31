class CompaniesController < ApplicationController
  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    @company.save
    flash[:notice] = "Empresa #{@company.name} cadastrada com sucesso!"
    redirect_to root_path
  end

  private

  def company_params
    params.require(:company).permit(:name, :logo)
  end
end