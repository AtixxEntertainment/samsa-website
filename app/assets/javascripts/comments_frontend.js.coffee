# open comment's form in a popup
$(document).on "click", "#main_navbar .comment-btn", ->
  $form = $(".new-comment-form")
  if $form.length is 0
    # there is no form. comment on home page
    $(".download-btn")[0].click()
    $(document).one "page:load", ->
      $(".comment-btn").trigger "click"
  else
    $form.bPopup
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
