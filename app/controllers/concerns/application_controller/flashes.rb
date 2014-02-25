class ApplicationController < ActionController::Base
  module Flashes
    extend ActiveSupport::Concern

    included do
      add_flash_types :error, :success
    end
  end
end
