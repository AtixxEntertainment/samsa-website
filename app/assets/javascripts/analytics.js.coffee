$(document).on 'page:change', ->
  ga('send', 'pageview')  # google analytics
  _gauges.push(['track']) # gauges
