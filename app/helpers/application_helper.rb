module ApplicationHelper
  def all_header_characters
    HeaderCharacter.cached_all.decorate
  end
end
