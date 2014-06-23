class PostsController < ApplicationController
  expose_decorated :post
  expose_decorated(:comments) {
    scope = post.comments.with_user.by_votes
    scope = scope.visible unless current_user.try(:admin?)
    scope
  }
  expose(:comment) {
    body = session.to_hash.fetch("attempt_comment", {}).fetch(:body, nil)
    Comment.new body: body
  }
  expose(:sponsors) {
    ["ile", "arcimego"]
  }

  def index
  end

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
