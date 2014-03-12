class PostsController < ApplicationController
  expose_decorated(:post) {
    Post.friendly.find params[:id]
  }
  expose_decorated(:comments) {
    post.comments.includes(user: :profile).by_votes
  }
  expose(:comment) {
    body = session.to_hash.fetch(:attempt_comment, {}).fetch(:body, nil)
    session[:attempt_comment] = nil
    Comment.new body: body
  }

  def like
    vote! 1
  end

  def dislike
    vote! -1
  end

  def random_comment
    self.comments = post.comments.random.decorate
  end

  private

  def vote!(value)
    post.add_or_update_evaluation(:votes, value, current_user)
  end
end
