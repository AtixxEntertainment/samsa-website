class HomeController < ApplicationController
  expose_decorated(:post) { Post.landing }
  expose_decorated(:comments) {
    post.comments.includes(:user).by_votes
  }
  expose(:comment) { Comment.new }

  def index
  end
end
