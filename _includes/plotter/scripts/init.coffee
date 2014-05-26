do ( App = window.Plotter ) ->

  # hub = $({})
  # App.on = ->
  #   hub.on.apply hub, arguments
  # App.off = ->
  #   hub.off.apply hub, arguments
  # App.trigger = ->
  #   hub.trigger.apply hub, arguments

  hub = new EventEmitter()

  App.on = ->
    hub.on.apply hub, arguments

  App.off = ->
    hub.off.apply hub, arguments

  App.emitEvent = ->
    hub.emitEvent.apply hub, arguments

  App.trigger = ->
    hub.trigger.apply hub, arguments

  $ ->
    $.getJSON "data/data-redux.json", ( json ) ->
      App.trigger "dataSetLoaded", [ json ]