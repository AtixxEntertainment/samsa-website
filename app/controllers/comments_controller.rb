class CommentsController < ApplicationController
  before_filter :comments_require_login, only: :create
  before_filter :require_login, only: :vote

  expose :comment, attributes: :comment_params
  expose(:commentable) {
    if params[:page_id].present?
      Page.find params[:page_id]
    else
      Post.find params[:post_id]
    end
  }

  def create
    session[:attempt_comment] = nil
    comment.user = current_user
    comment.commentable = commentable
    respond_to do |format|
      if comment.save
        CommentCreatedJob.new.async.perform comment.id
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
    comment.vote! params[:value], current_user
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
      session[:attempt_comment] = { body: comment_params[:body] }
      respond_to do |format|
        format.js { render "layouts/require_login" }
        format.html {
          flash[:warning] = I18n.t("ui.session.require_login")
          redirect_to login_path
        }
      end
      false
    end
  end
end
