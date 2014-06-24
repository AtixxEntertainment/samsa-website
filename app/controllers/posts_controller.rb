class PostsController < ApplicationController
  include Commentable

  expose_decorated :post

  alias_method :commentable, :post

  def like
    vote! 1
  end

  def dislike
    vote! -1
  end

  private

  def vote!(value)
    post.add_or_update_evaluation(:votes, value, current_user)
  end
end
