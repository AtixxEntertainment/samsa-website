class Atixx.Modal
  modalHidden: =>
    @$container.remove()

  constructor: (@body) ->
    @$container = $("<div />", html: @body)
    $("body").append @$container
    $modal = @$container.find(".modal")
    $modal.modal keyboard: true
    $modal.on "hidden.bs.modal", @modalHidden
