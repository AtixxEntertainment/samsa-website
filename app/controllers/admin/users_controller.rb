module Admin
  class UsersController < AdminController
    expose_decorated :user
    expose_decorated(:users) {
      User.all.includes(:profile)
    }

    def admin
      user.toggle! :admin
    end

    def ban
      user.toggle! :banned
    end

    def update
      self.user = current_user
      if user.update(user_attributes)
        flash[:success] = "Actualizado"
        redirect_to action: :edit, id: user.id
      else
        flash[:error] = "Algo salió mal"
        render :edit
      end
    end

    private

    def set_active
      @active_item = :usuarios
    end

    def user_attributes
      params.require(:user).permit :nombres, :email
    end
  end
end
