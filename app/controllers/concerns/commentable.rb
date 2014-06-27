module Commentable
  extend ActiveSupport::Concern

  included do
    helper_method :commentable

    expose(:comment) {
      body = session.to_hash.fetch("attempt_comment", {}).fetch(:body, nil)
      Comment.new body: body, commentable: commentable
    }
    expose_decorated(:comments) {
      scope = commentable.comments.with_user.by_votes
      scope = scope.visible unless current_user.try(:admin?)
      scope
    }
    expose(:highlight_comment) {
      commentable.comments.random.first.decorate if commentable.comments.count > 3
    }
  end

  def random_comment
    render "comments/random_comment"
  end
end
