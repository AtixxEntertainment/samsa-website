trackDownload = (e) ->
  platform = $(e.currentTarget).data("platform")
  setTimeout ->
    $.post "/game_download", {
      platform: platform,
      path: e.currentTarget.href
    }
  , 0
  true

$(document).on "click", ".post_descarga", trackDownload
