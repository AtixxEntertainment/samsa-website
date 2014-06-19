# switch comment's date on click
$(document).on "click", ".comment_header .date", (e) ->
  for node in e.currentTarget.children
    $(node).toggleClass "hidden"
