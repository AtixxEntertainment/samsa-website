class PagesController < ApplicationController
  include Commentable

  expose :page
  expose(:sponsors) {
    ["ile", "arcimego"]
  }

  alias_method :commentable, :page

  def index
    self.page = Page.descarga
  end

  def show
    if page == Page.otros_productos
      redirect_to products_path
    else
      # if page == Page.descarga
      redirect_to root_path
    end
  end
end
