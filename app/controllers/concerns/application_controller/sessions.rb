class ApplicationController < ActionController::Base
  module Sessions
    extend ActiveSupport::Concern

    included do
      expose_decorated(:decorated_current_user, decorator: UserDecorator) { current_user }
    end

    def current_user
      @current_user ||= User.cached_find(session[:user_id]) if session[:user_id]
    end
  end
end
