# only this object should be handling the dataset

do ( App = window.Plotter ) ->

  __ = ( arr ) ->
    return new Collection( arr )

  App.DataSorter = undefined

  App.on "dataSetComplete", ( event, data ) ->
    App.DataSorter = __( data )

  App.on "requestRender", ( event, data ) ->
    App.DataSorter # do something