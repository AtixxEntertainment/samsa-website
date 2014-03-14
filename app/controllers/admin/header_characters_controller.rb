module Admin
  class HeaderCharactersController < PreferencesController
    expose :header_character, attributes: :header_character_params

    def show
      self.header_character = header_character.decorate
    end

    def create
      if header_character.save
        redirect_to admin_preferences_path, success: "Creado"
      else
        render :new
      end
    end

    def update
      if header_character.update(header_character_params)
        redirect_to admin_preferences_path, success: "Actualizado"
      else
        render :edit
      end
    end

    def destroy
      header_character.destroy
      redirect_to action: :index
    end

    private

    def header_character_params
      params.require(:header_character).permit :nombre, :profundidad, :posicion_horizontal, :posicion_vertical
    end
  end
end
