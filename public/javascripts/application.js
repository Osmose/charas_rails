(function($) {
  $(function() {
    // Auto-embed midi files in the CR
    $(".embedMedia").media({
      height: 100,
      caption: false
    });

    // Zoom images in the CR
    $(".zoom").simpleZoom();

    // Enable hovering
    $(".hover").hoverIntent(function(obj, event) {
      $(this).children(".hoverText").fadeIn(300);
    }, function(obj, event) {
      $(this).children(".hoverText").fadeOut(300);
    });
  });
})(jQuery);