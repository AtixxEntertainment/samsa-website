class PostDecorator < ApplicationDecorator
  def status
    published_status
  end

  def title_with_admin_link
    h.link_to title, h.admin_post_path(object)
  end

  def author
    text = "#{object.user.nombres} el #{I18n.l created_at, format: :short}"
    h.content_tag :div, text, class: "light"
  end

  def body
    GitHub::Markdown.render(object.body).html_safe
  end

  def comments_count
    text = h.pluralize comments.count, "comentario"
    h.content_tag :div, text, class: "light"
  end

  private

  # status
  def published_status
    if published?
      status_text = "publicada"
      status_class = "success"
    else
      status_text = "no publicada"
      status_class = "default"
    end
    h.content_tag :span, status_text, class: "label label-#{status_class}"
  end

  def navbar_status
    h.content_tag(:span, "en navbar", class: "label label-info") if navbar?
  end
end
