class CommentsController < ApplicationController
  before_filter :require_login, only: :create

  expose(:post) { Post.cached_find params[:post_id] }
  expose :comment, attributes: :comment_params

  def create
    comment.user = current_user
    comment.post = post
    respond_to do |format|
      if comment.save
        format.html { redirect_to :back }
        format.js
      else
        format.html {
          redirect_to :back, error: comment.errors.full_messages.join
        }
        format.js
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit :body
  end

  def require_login
    unless current_user
      session[:comment_body] = comment_params[:body]
      flash[:warning] = "Debes autenticarte"
      respond_to do |format|
        format.html {
          redirect_to login_path
        }
        format.js {
          render :require_login
        }
      end
      false
    end
  end
end
