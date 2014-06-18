# encoding: utf-8
class ApplicationController < ActionController::Base
  module Sessions
    extend ActiveSupport::Concern

    included do
      helper_method :current_user
      expose_decorated(:decorated_current_user, decorator: UserDecorator) { current_user || GuestUser.new }
    end

    protected

    def current_user
      @current_user ||= User.cached_find(session[:user_id]) if session[:user_id]
    end

    def require_login
      unless current_user
        flash[:error] = "Debes autenticarte"
        respond_to do |format|
          format.html { redirect_to login_path }
          format.js { render "layouts/require_login" }
        end
        false
      end
    end
  end
end
