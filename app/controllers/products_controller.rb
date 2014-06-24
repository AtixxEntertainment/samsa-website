class ProductsController < ApplicationController
  include Commentable

  expose :page
  expose_decorated(:products) {
    Product.all.with_translations I18n.locale
  }

  alias_method :commentable, :page

  def index
    self.page = Page.otros_productos
  end
end
