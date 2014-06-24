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
    redirect_to root_path if page == Page.descarga
  end
end
