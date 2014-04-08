$(document).on 'page:change', ->
  ga('send', 'pageview') if ga
