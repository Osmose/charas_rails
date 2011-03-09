/*
 * jQuery Simple Zoom Plugin for zooming in and out of sprites
 *
 * Copyright (c) 2011 Michael Kelly
 * Licensed under the MIT License:
 * http://www.opensource.org/licenses/mit-license.php
 *
 * @author: Michael Kelly
 * @version: 0.1 (8-MAR-2011)
 *
 * Inspired by the zooming script at www.pixeljoint.com
 */
;(function($){

var settings = {
  zoomOutText: "-",
  zoomInText: "+",
  zoomStep: 2,
  nearestNeighbor: true,
  notSmaller: true
};

/**
 * Adds zoom controls to children; probably not a good idea to call on
 * non-images.
 *
 * @param options
 */
$.fn.simpleZoom = function(options) {
  return this.each(function() {
    var e = this;
    var je = $(e);
    if (options) {
      $.extend(settings, options);
    }

    // Original data is used as a reference
    $.data(e, "simpleZoom_oWidth", je.width());
    $.data(e, "simpleZoom_oHeight", je.height());
    $.data(e, "simpleZoom_zoomLevel", 1);

    if (settings.nearestNeighbor) {
      je.css("image-rendering", "-moz-crisp-edges");
      je.css("-ms-interpolation-mode", "nearest-neighbor");
    }

    // Create buttons to add
    zoomOut = generateButton(settings.zoomOutText, function() {
      changeZoom(e, div);
    });

    zoomIn = generateButton(settings.zoomInText, function() {
      changeZoom(e, mult);
    });

    // Create container, add buttons, and append next to element
    var controls = $('<div class="zoomControls">')
      .append(zoomOut)
      .append(zoomIn);

    var container = $('<div class="zoomContainer">')
      .css("overflow", "auto");

    je.wrap(container).parent(".zoomContainer").after(controls);
  });
};

function changeZoom(elem, op) {
  var zoomLevel = $.data(elem, "simpleZoom_zoomLevel");
  var oWidth = $.data(elem, "simpleZoom_oWidth");
  var oHeight = $.data(elem, "simpleZoom_oHeight");

  zoomLevel = op(zoomLevel, settings.zoomStep);
  if (settings.notSmaller && zoomLevel < 1) {
    zoomLevel = 1; // Don't zoom smaller than original
  }

  var je = $(elem);
  je.width(oWidth * zoomLevel);
  je.height(oHeight * zoomLevel);

  $.data(elem, "simpleZoom_zoomLevel", zoomLevel);
}

function div(a, b) {
  return a / b;
}

function mult(a, b) {
  return a * b;
}

function generateButton(text, onclick) {
  return $('<a href="#" class="zoomButton">' + text + "</a>").click(onclick);
}

})(jQuery);