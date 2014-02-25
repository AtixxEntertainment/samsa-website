applyRetina = ->
  $("img:not(.no_retina)").retina() # apply retina to all images

jQuery applyRetina
$(document).on "page:load", applyRetina
