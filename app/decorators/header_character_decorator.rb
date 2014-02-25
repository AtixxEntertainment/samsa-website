class HeaderCharacterDecorator < ApplicationDecorator
  def avatar(classes: "" )
    h.image_tag imagen_url, class: "header-character #{classes}", style: styles
  end

  def imagen_url
    "/images/header_#{nombre}.png"
  end

  def styles
    "#{horizontal_style} #{vertical_style} #{z_index_style}"
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
end
