class CommentDecorator < ApplicationDecorator
  def votes
    h.content_tag :span, object.votes, class: "comment-vote"
  end

# vote buttons
  def vote_buttons
    vote_button(:up) + vote_button(:down)
  end

  def vote_button(value)
    h.link_to h.image_tag("/images/icon_#{value}.png"),
      h.vote_post_comment_path(object.post_id, object, value: value),
      method: :post,
      remote: true,
      class: "comment-vote vote-#{value}"
  end

# moderate buttons
  def moderate_buttons
    text = visible ? "Ocultar" : "Mostrar"
    h.link_to text, h.toggle_admin_comment_path(object), method: :post, remote: true, class: "btn btn-default btn-xs"
  end

  def visibility
    unless visible?
      h.content_tag :div do
        h.content_tag :span, "Oculto", class: "label label-default"
      end
    end
  end
end
