# switch comment's date on click
$(document).on "click", ".comment_header .date", (e) ->
  for node in e.currentTarget.children
    $(node).toggleClass "hidden"

# open comment's form in a popup
$(document).on "click", ".comment-btn", ->
  $(".new-comment-form").bPopup
    speed: 400,
    transition: "slideDown"
  false

# apply elastic to comment form
applyElastic = -> $("textarea#comment_body").elastic()
jQuery applyElastic
$(document).on "page:load", applyElastic
