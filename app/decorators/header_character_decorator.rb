class HeaderCharacterDecorator < ApplicationDecorator
  def avatar(classes: "" )
    h.image_tag imagen_url, class: "header-character #{classes}", style: avatar_styles
  end

  def parallax_avatar
    h.content_tag :div, avatar, class: "layer", style: layer_styles, data: { depth: depth }
  end

  def imagen_url
    "/images/header_characters/header_#{nombre}.png"
  end

  def avatar_styles
    "#{horizontal_style} #{vertical_style}"
  end

  def layer_styles
    "#{z_index_style}"
  end

  def horizontal_style
    position = posicion_horizontal.to_i
    if position < 50
      position = position - 10
      "left: #{position}%;"
    else
      position = 90 - position
      "right: #{position}%;"
    end
  end

  def vertical_style
    position = posicion_vertical.to_i
    "bottom: #{position}px;"
  end

  def z_index_style
    "z-index: -#{profundidad};"
  end

  def depth
    profundidad / 15.to_f
  end
end
