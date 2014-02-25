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
  end
end
