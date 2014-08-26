trackDownload = (e) ->
  platform = if $(e.target).hasClass("windows") then "windows" else "mac"
  setTimeout ->
    $.post "/game_download", {
      platform: platform,
      path: e.target.href
    }
  , 0
  true

$(document).on "click", ".post_descarga", trackDownload
