# encoding: utf-8
module Admin
  class PreferencesController < AdminController
    expose_decorated :header_characters
    expose(:landing_page) { Preference.landing_page }
    expose(:subscribers) { Preference.subscribers }
    expose(:possible_posts) {
      Post.select(:id, :title).collect {|post| [post.title, post.id]}
    }
    expose(:possible_subscriptors) {
      User.with_email.admins.select(:id, :nombres).collect {|user| [user.nombres, user.id]}
    }

    def update
      render js: "alert('Algo salió mal');" unless Preference.preference(params[:preference][:name]).update(preference_attributes)
    end

    private

    def set_active
      @active_item = :preferencias
    end

    def preference_attributes
      params.require(:preference).permit!.slice :value # allow value to be simple or complex value
    end
  end
end
