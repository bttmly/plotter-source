# only this object should be handling the dataset

do ( App = window.Plotter ) ->

  __ = ( arr ) ->
    return new Collection( arr )

  App.DataSorter = undefined

  App.on "dataSetLoaded", ( event, data ) ->
    App.DataSorter = __( data )

  App.on "requestRender", ( event, data ) ->
    sortData = data

    sortData.seasons = sortData.seasons.map( Number )
    ppProp = if sortData.ppVal[0].length is 2 then "fantPos" else "name"

    sortArr = [
      prop: ppProp
      vals: sortData.ppVal
    ,
      prop: "season"
      vals: sortData.seasons
    ]

    App.ChartDrawer( sortData.vars, App.DataSorter.multiWhereArray( sortArr ) )

