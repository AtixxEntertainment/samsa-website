# encoding: utf-8
class ApplicationController < ActionController::Base
  module Sessions
    extend ActiveSupport::Concern

    included do
      expose_decorated(:decorated_current_user, decorator: UserDecorator) { current_user || GuestUser.new }
    end

    def current_user
      @current_user ||= User.cached_find(session[:user_id]) if session[:user_id]
    end

    def require_login
      unless current_user
        flash[:error] = "Por favor inicia sesión"
        redirect_to login_path
        false
      end
    end
  end
end
