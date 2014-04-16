# encoding: utf-8
module Admin
  class PostsController < AdminController
    expose_decorated(:posts) { Post.includes(:user) }
    expose_decorated(:comments) { post.comments.with_user.order(:id) }
    expose :post, attributes: :post_params

    def show
      self.post = post.decorate
    end

    def preview
      render layout: "modal"
    end

    def create
      post.user = current_user
      if post.save
        redirect_to action: :show, id: post.id
      else
        flash[:danger] = "Algo salió mal"
        render :new
      end
    end

    def update
      if post.update(post_params)
        redirect_to action: :show, id: post.id
      else
        flash[:danger] = "Algo salió mal"
        render :edit
      end
    end

    def destroy
      post.destroy
      redirect_to action: :index
    end

    private

    def post_params
      params.require(:post).permit :title, :body, :published, :navbar
    end

    def set_active
      @active_item = :entradas
    end
  end
end
