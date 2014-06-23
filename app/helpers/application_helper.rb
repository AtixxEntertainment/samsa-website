module ApplicationHelper
  def link_to_locale(locale)
    content_tag :span, class: "locale-option" do
      link_to_unless current_locale_is?(locale), t("ui.locale.#{locale}"), lang: locale
    end
  end

  def current_locale_is?(locale)
    current_locale == locale
  end

  def gfm_and_html_support
    content_tag :span, class: "light" do
      link_to("Github flavored markdown", "https://help.github.com/articles/github-flavored-markdown", target: "_blank") +
      " y HTML"
    end
  end
end
