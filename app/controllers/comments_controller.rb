class CommentsController < ApplicationController
  before_filter :comments_require_login, only: :create
  before_filter :require_login, only: :vote

  expose(:post) { Post.friendly.find params[:post_id] }
  expose :comment, attributes: :comment_params

  def create
    comment.user = current_user
    comment.post = post
    respond_to do |format|
      if comment.save
        format.html { redirect_to :back }
        format.js { self.comment = comment.decorate }
      else
        format.html {
          redirect_to :back, error: comment.errors.full_messages.join
        }
        format.js
      end
    end
  end

  def vote
    self.comment = Comment.find(params[:id])
    render :cant_vote and return if current_user == comment.user
    value = params[:value] == "up" ? 1 : -1
    comment.add_or_update_evaluation :votes, value, current_user
    respond_to do |format|
      format.html { redirect_to :back }
      format.js { self.comment = comment.decorate }
    end
  end

  private

  def comment_params
    params.require(:comment).permit :body
  end

  def comments_require_login
    unless current_user
      session[:attempt_comment] = { body: comment_params[:body], post_id: params[:post_id] }
      flash[:warning] = "Debes autenticarte"
      respond_to do |format|
        format.html { redirect_to login_path }
        format.js { render :require_login }
      end
      false
    end
  end
end
