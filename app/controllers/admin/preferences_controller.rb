module Admin
  class PreferencesController < AdminController
    expose_decorated :header_characters
    private

    def set_active
      @active_item = :preferencias
    end
  end
end
