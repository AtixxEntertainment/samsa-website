window.helpers ||= {}

window.helpers.primaryCommentSwitcherHelper =
  timeoutId: null

  updateWith: (html) ->
    htmlContent = $(html).html()
    @$node.html htmlContent
    @$node.fadeIn()

  scheduleCommentChange: ->
    @$node.fadeOut =>
      @timeoutId = setTimeout =>
        $.getScript "/posts/#{@$node.data("post_id")}/random_comment"
        @scheduleCommentChange()
      , 5000 # 5 seconds

  init: ->
    clearTimeout(@timeoutId) if @timeoutId
    if document.getElementById("comentario_destacado")
      @$node = $("#comentario_destacado")
      @scheduleCommentChange()

jQuery -> helpers.primaryCommentSwitcherHelper.init()
$(document).on "page:load", helpers.primaryCommentSwitcherHelper.init()