class UserDecorator < ApplicationDecorator
  def avatar(size: nil, margin: "little-horizontal-margin", classes: "profile-image")
    h.image_tag imagen, class: "#{classes} #{size} #{margin} no_retina"
  end
end
