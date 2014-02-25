class @headerCharactersPositionHelper
  constructor: ->
    @$character = $(".header-preview .current-character")
    @$posicionVertical = $("#posicion_vertical_value")
    $("#header_character_posicion_horizontal").on("change", @horizontalSliderChanged)
                                   .trigger("change")
    $("#header_character_posicion_vertical").on("change", @verticalSliderChanged)
                                   .trigger("change")

  horizontalSliderChanged: (e) =>
    position = parseInt e.target.value, 10
    top = @$character.css "top"
    bottom = @$character.css "bottom"
    @$character.removeAttr "style"
    if position < 50
      position = position - 10
      @$character.css left: "#{position}%"
    else if position >= 50
      position = 90 - position
      @$character.css right: "#{position}%"
    @$character.css top: top, bottom: bottom

  verticalSliderChanged: (e) =>
    position = parseInt e.target.value, 10
    @$posicionVertical.html position
    @$character.css "bottom", "#{position}px"
