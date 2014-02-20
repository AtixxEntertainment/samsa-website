class ApplicationController < ActionController::Base
  module Sessions
    def current_user
      @current_user ||= User.cached_find(session[:user_id]) if session[:user_id]
    end
  end
end
