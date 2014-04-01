do ( App = window.Plotter ) ->

  hub = $({})
  App.on = ->
    hub.on.apply hub, arguments
  App.off = ->
    hub.off.apply hub, arguments
  App.trigger = ->
    hub.trigger.apply hub, arguments

  $ ->
    $.getJSON "data/clean-dataset.08-13.min.json", ( json ) ->
      App.trigger "dataSetLoaded", [ json ]