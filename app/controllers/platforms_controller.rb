class PlatformsController < ApplicationController
    before_action :authenticate_admin!

    def index
      @platforms = Platform.all
    end

    def show
      @platform = Platform.find(params[:id])
    end

    private

    def params_platform
      params.require(:platform).permit(:name)
    end
end
