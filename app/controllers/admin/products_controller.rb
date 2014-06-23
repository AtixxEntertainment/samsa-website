module Admin
  class ProductsController < AdminController
    expose :product, attributes: :product_params
    expose_decorated(:products) {
      Product.all.includes :translations
    }

    def show
      self.product = product.decorate
    end

    def create
      if product.save
        redirect_to action: :show, id: product.id
      else
        flash[:danger] = "Algo salió mal"
        render :new
      end
    end
    alias_method :update, :create

    def destroy
      product.destroy
      redirect_to action: :index
    end

    private

    def product_params
      params.require(:product).permit :title, :image, :image_cache, :kind, :producer, :summary
    end

    def set_active
      @active_item = :productos
    end
  end
end
