/*! Tiny Pub/Sub - v0.7.0 - 2013-01-29
* https://github.com/cowboy/jquery-tiny-pubsub
* Copyright (c) 2013 "Cowboy" Ben Alman; Licensed MIT */
(function($) {

  var o = $({});

  $.sub = function() {
    o.on.apply(o, arguments);
  };

  $.unsub = function() {
    o.off.apply(o, arguments);
  };

  $.pub = function() {
    o.trigger.apply(o, arguments);
  };

}(jQuery));