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
      id = @$node.data("commentable_id")
      type = @$node.data("commentable_type")
      $.getScript "/#{type}/#{id}/random_comment.js"
      @scheduleCommentChange()
    , 10000 # 10 seconds

  init: ->
    clearTimeout(@timeoutId) if @timeoutId
    if document.getElementById("comentario_destacado")
      @$node = $("#comentario_destacado")
      @scheduleCommentChange()

jQuery -> helpers.primaryCommentSwitcherHelper.init()
$(document).on "page:change", -> helpers.primaryCommentSwitcherHelper.init()
