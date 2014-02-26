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

    private

    def set_active
      @active_item = :usuarios
    end
  end
end
