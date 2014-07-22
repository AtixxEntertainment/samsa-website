class PagesController < ApplicationController
  include Commentable

  SPONSORS = {
    "ile" => "https://www.facebook.com/ILEEcuador",
    "arcimego" => "https://www.facebook.com/arcimego.ca"
  }.freeze

  expose :page
  expose(:sponsors) { SPONSORS }
  expose(:game) { GameVersion.visible.last }

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
