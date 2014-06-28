class ApplicationController < ActionController::Base
  module Internationalization
    extend ActiveSupport::Concern

    included do
      before_filter :set_locale
      helper_method :current_locale
    end

    private

    def set_locale
      session[:current_locale] = params[:lang] if params[:lang].present?
      I18n.locale = current_locale
    end

    def current_locale
      session[:current_locale] or
      request.env['HTTP_ACCEPT_LANGUAGE'].to_s.scan(/^[a-z]{2}/).first
    end
  end
end
