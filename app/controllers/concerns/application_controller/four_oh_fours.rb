class ApplicationController < ActionController::Base
  module FourOhFours
    extend ActiveSupport::Concern

    included do
      unless Rails.application.config.consider_all_requests_local
        rescue_from ActiveRecord::RecordNotFound, :with => :render_not_found
        rescue_from ActionController::RoutingError, :with => :render_not_found
      end
    end

    def routing_error
      render_not_found(nil)
    end
    
    protected

    def render_not_found(exception=nil)
      render :template => "/errors/404.html.slim", :layout => "application.html.slim", :status => 404
    end
  end
end
