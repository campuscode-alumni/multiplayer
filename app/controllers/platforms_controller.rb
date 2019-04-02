class PlatformsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @platforms = Platform.all
  end

  def new
    @platform = Platform.new
    @companies = Company.all
  end

  def create
    @platform = Platform.new(params_platform)
    if @platform.save
      flash[:notice] = "Plataforma #{@platform.name} criada com sucesso!"
      redirect_to @platform
    else
      @companies = Company.all
      render :new
    end
  end

  def show
    @platform = Platform.find(params[:id])
  end

  private

  def params_platform
    params.require(:platform).permit(:name, :logo, :company_id)
  end
end
