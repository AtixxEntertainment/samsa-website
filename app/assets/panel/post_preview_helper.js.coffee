class PostPreviewHelper
  gotResponse: (data) =>
    @$button.removeClass "disabled"
    new Atixx.Modal(data)

  previewPost: (e) =>
    @$button = $(e.target).addClass "disabled"
    $.post "/admin/posts/preview", {body: $("#post_body").val()}, @gotResponse
    false

  constructor: ->
    $(document).on "click", "#post-preview-button", @previewPost

new PostPreviewHelper()
