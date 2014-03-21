# only this object should be handling the dataset

Plotter.DataSorter = ->

  dataset = undefined

  $ ->
    $.getJSON Plotter.settings.url.dataset, ( json ) ->
      dataset = JSON.parse( json )