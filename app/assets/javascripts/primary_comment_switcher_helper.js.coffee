window.helpers ||= {}

window.helpers.primaryCommentSwitcherHelper =
  timeoutId: null

  updateWith: (html) ->
    @$node.fadeOut =>
      htmlContent = $(html).html()
      @$node.html htmlContent
      @$node.fadeIn()

  scheduleCommentChange: ->
    @timeoutId = setTimeout =>
      $.getScript "/posts/#{@$node.data("post_id")}/random_comment"
      @scheduleCommentChange()
    , 10000 # 10 seconds

  init: ->
    clearTimeout(@timeoutId) if @timeoutId
    if document.getElementById("comentario_destacado")
      @$node = $("#comentario_destacado")
      @scheduleCommentChange()

jQuery -> helpers.primaryCommentSwitcherHelper.init()
$(document).on "page:load", helpers.primaryCommentSwitcherHelper.init()