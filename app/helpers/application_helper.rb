module ApplicationHelper
  def link_to_locale(locale)
    content_tag :span, class: "locale-option" do
      link_to_unless current_locale_is?(locale), t("ui.locale.#{locale}"), lang: locale
    end
  end

  def current_locale_is?(locale)
    current_locale == locale
  end
end
