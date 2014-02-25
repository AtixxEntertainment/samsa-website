(function( $ ){
  $.fn.retina = function(options) {
    if(window.devicePixelRatio >= 2) {
      var retinaPart = "@2x";

      this.each(function(index, element) {
        if(!$(element).attr('src')) return;

        var checkForRetina = new RegExp("(.+)(" + retinaPart + "\\.\\w{3,4})");
        if(checkForRetina.test($(element).attr('src'))) return;

        var newImageSrc = $(element).attr("src").replace(/(.+)(\.\w{3,4})$/, "$1" + retinaPart + "$2");
        $.ajax({url: newImageSrc, type: "HEAD", success: function() {
          if (options && options.lockDimensions) {
            // lock dimensions
            var height = $(element).height(),
                width = $(element).width();
            $(element).css({ height: height, width: width });
          }
          $(element).attr("src", newImageSrc);
        }});
      });
    }
    return this;
  }
})( jQuery );
