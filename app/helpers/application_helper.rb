module ApplicationHelper
  def all_header_characters
    HeaderCharacter.cached_all.decorate
  end

  def navbar_item(title, link)
    content_tag :li, class: "#{"active" if @active_item == title.downcase.to_sym}" do
      link_to title, link
    end
  end
end
