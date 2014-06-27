class NewsController < ApplicationController
  expose_decorated(:posts) {
    Post.published.recent
  }
end
