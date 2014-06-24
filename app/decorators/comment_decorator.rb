class CommentDecorator < ApplicationDecorator
  def votes
    h.content_tag :span, object.votes, class: "comment-vote"
  end

  def visibility
    unless visible?
      h.content_tag :div do
        h.content_tag :span, "Oculto", class: "label label-default"
      end
    end
  end

  def moderate_buttons
    text = visible ? "ocultar" : "mostrar"
    h.link_to text, h.toggle_admin_comment_path(object), method: :post, remote: true
  end

# date
  def created_at
    h.content_tag :div, class: "date" do
      time_ago + absolute_date
    end
  end

  def time_ago
    h.content_tag :div do
      h.time_ago_in_words object.created_at
    end
  end

  def absolute_date
    h.content_tag :div, class: "hidden" do
      h.l object.created_at, format: :short
    end
  end

# vote buttons
  def vote_buttons
    vote_button(:up) + vote_button(:down)
  end

  def vote_button(value)
    h.link_to h.image_tag("/images/icon_#{value}.png"),
      vote_link(value),
      method: :post,
      remote: true,
      class: "comment-vote vote-#{value}"
  end

  def vote_link(value)
    commentable = object.commentable_type.downcase
    method_name = "vote_#{commentable}_comment_path"
    h.send method_name, object.commentable_id, object, value: value
  end
end
