module Admin
  class MediaController < AdminController
    expose_decorated :attachments
    expose :attachment, attributes: :attachment_params

    def index
    end

    def create
      if attachment.save
        redirect_to action: :index
      else
        flash[:danger] = "Algo salió mal"
        render :new
      end
    end

    def update
      if attachment.update(attachment_params)
        redirect_to action: :index
      else
        flash[:danger] = "Algo salió mal"
        render :edit
      end
    end

    def destroy
      attachment.destroy
      redirect_to action: :index
    end

    private

    def attachment_params
      params.require(:attachment).permit :name, :file
    end

    def set_active
      @active_item = :multimedia
    end
  end
end
