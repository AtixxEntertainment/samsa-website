module Admin
  class UsersController < AdminController
    expose_decorated :user
    expose_decorated(:users) {
      User.all.includes(:profile)
    }

    def admin
      user.toggle! :admin
    end
  end
end
