module ApplicationHelper
  def all_header_characters
    HeaderCharacter.all.decorate
  end

  def posts_in_navbar
    @posts_in_navbar ||= Post.in_navbar
  end

  def link_to_locale(locale)
    content_tag :span, class: "locale-option" do
      link_to_unless current_locale_is?(locale), t("ui.locale.#{locale}"), lang: locale
    end
  end

  def current_locale_is?(locale)
    current_locale == locale
  end
end
