trackDownload = ->
  setTimeout ->
    $.post "/game_download"
  , 0
  true

$(document).on "click", ".post_descarga", trackDownload
