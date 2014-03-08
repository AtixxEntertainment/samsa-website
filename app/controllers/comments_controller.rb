class CommentsController < ApplicationController
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
end
