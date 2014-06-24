class PostsController < ApplicationController
  include Commentable

  expose_decorated :post

  alias_method :commentable, :post
end
