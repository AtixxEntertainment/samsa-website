class HomeController < ApplicationController
  expose_decorated(:post) { Post.landing }

  def index
  end
end
