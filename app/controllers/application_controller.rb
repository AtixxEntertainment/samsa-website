class ApplicationController < ActionController::Base
  include Sessions
  include Flashes
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  # exception notifier:
  unless Rails.application.config.consider_all_requests_local
    rescue_from ActiveRecord::RecordNotFound, :with => :render_not_found
    rescue_from ActionController::RoutingError, :with => :render_not_found
  end

  def routing_error
    render_not_found(nil)
  end

  # decent exposure strong parameters
  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  protected

  def render_not_found(exception=nil)
    render :template => "/errors/404.html.slim", :layout => "application.html.slim", :status => 404
  end

  def render_error(exception)
    ExceptionNotifier::Notifier.exception_notification(request.env,exception).deliver
    render :template => "/errors/500.html.slim", :layout => "application.html.slim", :status => 500
  end
end
