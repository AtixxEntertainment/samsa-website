class UserDecorator < ApplicationDecorator
  def avatar(size: nil, margin: "little-horizontal-margin")
    h.image_tag imagen, class: "profile-image #{size} #{margin}"
  end
end
