class PageDecorator < ApplicationDecorator
  def title_with_admin_link
    h.link_to title, h.admin_post_path(object)
  end
end
