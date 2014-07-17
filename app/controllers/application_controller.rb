class ApplicationController < ActionController::Base
  include Sessions
  include Flashes
  include FourOhFours
  include Internationalization
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  has_mobile_fu false

  # decent exposure strong parameters
  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  expose(:posts_in_navbar) {
    { download:       root_path,
      news:           news_index_path,
      other_products: products_path,
      comment:        "#" }
  }

  expose_decorated(:all_header_characters,
                   decorator: Draper::CollectionDecorator) {
    HeaderCharacter.all
  }
end
