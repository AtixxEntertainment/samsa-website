class HomeController < ApplicationController
  expose_decorated(:post) { Post.landing }
  expose_decorated(:comments) { post.comments.includes(:user) }
  expose :comment

  def index
  end
end
