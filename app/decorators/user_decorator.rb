class UserDecorator < ApplicationDecorator
  def avatar(size: nil, margin: "little-horizontal-margin", classes: "profile-image")
    h.link_to profile_url, target: "_blank" do
      h.image_tag imagen, class: "#{classes} #{size} #{margin} no_retina"
    end
  end

  def nombres_with_link(options={})
    h.link_to nombres, profile_url, options.merge(target: "_blank")
  end

  def profile_url
    return nil unless profile
    case profile.provider
    when "twitter"
      profile.urls["Twitter"]
    when "facebook"
      profile.urls["Facebook"]
    end
  end

  def email
    h.link_to object.email, "mailto:#{object.email}" unless object.email.blank?
  end

  def admin_badge
    h.content_tag(:span, "Administrador", class: "label label-primary") if object.admin?
  end

  def ban_badge
    h.content_tag(:span, "Banned", class: "label label-danger") if object.banned?
  end

  def toggle_admin_button_text
    if object.admin?
      "Quitar administración"
    else
      "Hacer administrador"
    end
  end

  def toggle_admin_button
    h.link_to toggle_admin_button_text, h.admin_admin_user_path(object), remote: true, class: "btn btn-default btn-sm"
  end

  def toggle_ban_button_text
    if object.banned?
      "Quitar ban"
    else
      "Ban"
    end
  end

  def toggle_ban_button
    h.link_to toggle_ban_button_text, h.ban_admin_user_path(object), remote: true, class: "btn btn-default btn-sm"
  end

  def social_profile
    if object.profile.provider == "twitter"
      link_path = "http://twitter.com/" + object.profile.nickname
    else
      link_path = "http://facebook.com/" + object.profile.nickname
    end
    h.link_to object.profile.provider.capitalize, link_path, class: "label label-success", target: "_blank"
  end
end
