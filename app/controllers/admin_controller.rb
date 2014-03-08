class AdminController < ApplicationController
  before_filter :confirm_logged_in_is_admin, :set_active

  layout "admin"

  def index
  end

  protected

  def confirm_logged_in_is_admin
    if not current_user or not current_user.admin?
      redirect_to root_path
      false
    end
  end

  private

  def set_active
  end
end
