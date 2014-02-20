class SessionsController < ApplicationController
  def create
    session[:user_id] = User.create_or_update_from_omniauth(request.env["omniauth.auth"]).id
    raise "not so fast, sweetie"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
