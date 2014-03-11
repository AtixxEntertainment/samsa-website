class HomeController < PostsController
  def index
    self.post = Post.landing
  end
end
