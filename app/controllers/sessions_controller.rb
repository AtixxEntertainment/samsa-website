class SessionsController < ApplicationController
  def create
    @user = User.create_or_update_from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = @user.id
    redirect_to redirection_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def redirection_path
    if session[:attempt_comment]
      post_path session[:attempt_comment][:post_id], anchor: "comentar"
    elsif @user.admin?
      admin_path
    else
      root_path
    end
  end
end
