class FlashesHelper
  constructor: ->
    for flash in $(".flashes .flash")
      $flash = $(flash)
      toastr[$flash.data("type")] $flash.text()

initializeFlashesHelper = ->
  new FlashesHelper

jQuery initializeFlashesHelper
$(document).on "page:load", initializeFlashesHelper
