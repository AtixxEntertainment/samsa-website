trackDownload = (e) ->
  platform = $(e.currentTarget).data("platform")
  path = e.currentTarget.href
  setTimeout ->
    $.post "/game_download", {
      platform: platform,
      path: path
    }
  , 0
  true

$(document).on "click", ".post_descarga", trackDownload
