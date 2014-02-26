# encoding: utf-8
module Admin
  class PreferencesController < AdminController
    expose_decorated :header_characters
    expose(:landing_page) { Preference.landing_page }
    expose(:possible_posts) {
      Post.select(:id, :title).collect {|post| [post.title, post.id]}
    }

    def update
      render js: "alert('Algo salió mal');" unless Preference.preference(params[:preference][:name]).update(preference_attributes)
    end

    private

    def set_active
      @active_item = :preferencias
    end

    def preference_attributes
      params.require(:preference).permit :value
    end
  end
end
