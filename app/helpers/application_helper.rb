module ApplicationHelper
  def all_header_characters
    HeaderCharacter.cached_all.decorate
  end

  def posts_in_navbar
    @posts_in_navbar ||= Post.in_navbar
  end
end
