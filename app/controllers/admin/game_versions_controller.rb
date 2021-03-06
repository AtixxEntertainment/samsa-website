# encoding: utf-8
module Admin
  class GameVersionsController < AdminController
    expose(:game_versions)
    expose :game_version, attributes: :game_version_params

    def create
      if game_version.save
        redirect_to action: :index
      else
        flash[:danger] = "Algo salió mal"
        render :new
      end
    end
    alias_method :update, :create

    def destroy
      game_version.destroy
      redirect_to action: :index
    end

    private

    def game_version_params
      params.require(:game_version).permit :tag, :changelog, :windows_url, :mac_url, :hidden
    end

    def set_active
      @active_item = :versiones
    end
  end
end
