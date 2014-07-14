applyParallax = ->
  if screen.width > 500
    for scene in $(".parallax-scene")
      new Parallax(scene)

jQuery applyParallax
$(document).on "page:load", applyParallax
