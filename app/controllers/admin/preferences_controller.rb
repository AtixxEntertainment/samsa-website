module Admin
  class PreferencesController < AdminController
    expose_decorated :header_characters
    expose(:landing_page) { Preference.landing_page }
    expose(:possible_posts) {
      Post.select(:id, :title).collect {|post| [post.title, post.id]}
    }

    def update
      Preference.preference(params[:preference][:name]).update preference_attributes
      render js: ";"
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
