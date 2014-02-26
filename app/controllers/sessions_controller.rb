class SessionsController < ApplicationController
  def create
    user = User.create_or_update_from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id
    if user.admin?
      redirect_to admin_path
    else
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
