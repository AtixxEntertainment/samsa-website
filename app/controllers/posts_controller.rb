class PostsController < ApplicationController
  include Commentable

  expose_decorated :post

  def show
    self.post = Post.find params[:id]
  end

  alias_method :commentable, :post
end
