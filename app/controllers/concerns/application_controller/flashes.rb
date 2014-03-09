class ApplicationController < ActionController::Base
  module Flashes
    extend ActiveSupport::Concern

    included do
      add_flash_types :error, :success, :warning
    end
  end
end
