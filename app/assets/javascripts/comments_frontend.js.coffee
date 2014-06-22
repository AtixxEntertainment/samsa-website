# open comment's form in a popup
$(document).on "click", "#main_navbar .comment-btn", ->
  $(".new-comment-form").bPopup
    speed: 400,
    transition: "slideDown",
    positionStyle: "fixed",
    onOpen: ->
      $(".comment-btn").addClass "active"
    onClose: ->
      $(".comment-btn").removeClass "active"
  false

# apply elastic to comment form
applyElastic = -> $("textarea#comment_body").elastic()
jQuery applyElastic
$(document).on "page:load", applyElastic
