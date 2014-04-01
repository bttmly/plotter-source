# only this object should be handling the dataset
Plotter.DataSorter = do ->
  fullSet = undefined
  subSet = undefined
  ajaxPromise = undefined

  getDataset = ->
    $.getJSON "data/clean-dataset.08-12.min.json", ( json ) ->
      fullSet = new Collection( json )
      $.pub "dataset:complete", [ fullSet ]

  # names quack one way, positions another
  duckFilter = ( ppArr, seasonArr ) ->
    unless fullSet
      throw new Error( "Sorry, dataset not loaded." )
      return

    prop = ""
    if ppArr[0].split( " " ).length > 1
      prop = "name"
    else
      prop = "position"

    filterObj = [
      prop: prop
      vals: ppArr
    ,
      prop: "season"
      vals: positionArr 
    ]

    subSet = fullSet.multiWhereArray( filterObj, true )
    
  $ ->
    getDataset()

  duckFilter : duckFilter
  fullSet: ->
    return fullSet
  subSet : ->
    return subSet