# encoding: utf-8
module Admin
  class PagesController < AdminController
    expose :page
    expose_decorated :pages
    expose_decorated(:comments) {
      page.comments.with_user.order(:id)
    }

    private

    def set_active
      @active_item = :páginas
    end
  end
end
