module Commentable
  extend ActiveSupport::Concern

  included do
    expose(:comment) {
      body = session.to_hash.fetch("attempt_comment", {}).fetch(:body, nil)
      Comment.new body: body, commentable: commentable
    }
    expose_decorated(:comments) {
      scope = commentable.comments.with_user.by_votes
      scope = scope.visible unless current_user.try(:admin?)
      scope
    }
  end

  def random_comment
    self.comments = commentable.comments.random.decorate
    render "comments/random_comment"
  end
end
