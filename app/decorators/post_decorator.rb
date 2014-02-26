class PostDecorator < ApplicationDecorator
  def status
    if published?
      status_text = "publicada"
      status_class = "success"
    else
      status_text = "no publicada"
      status_class = "default"
    end
    h.content_tag :div, class: "block" do
      h.content_tag :span, status_text, class: "label label-#{status_class}"
    end
  end

  def author
    text = "#{object.user.nombres} el #{I18n.l created_at, format: :short}"
    h.content_tag :div, text, class: "light"
  end

  def body
    GitHub::Markdown.render(object.body).html_safe
  end
end
