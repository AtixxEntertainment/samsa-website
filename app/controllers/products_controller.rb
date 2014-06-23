class ProductsController < ApplicationController
  expose_decorated(:products) {
    Product.all.with_translations I18n.locale
  }
end
