window.DataManipulator = do ->

  data = undefined
  dataCol = undefined

  $ ->
    $.getJSON "data/dataset.additions.08-12.json", ( d ) ->
      data = d
      dataCol = new Collection( data )

      DataManipulator.flattenData()
      DataManipulator.downcaseProps()

      window.newDataSet = data

  flattenData : ->
    results = []
    seasons = Object.keys( data )
    console.log seasons
    
    positions = Object.keys( data[seasons[0]] )
    console.log  positions

    for season in seasons
      for position in positions
        for player in data[season][position]

          results.push( player )

    data = results

  downcaseProps : ->
    results = []
    for player in data
      p = new Object()
      for key in Object.keys( player )
        if key is "GS"
          newKey = "gamesStarted"
        else if key is "G"
          newKey = "gamesPlayed"
        else if key is "VBD"
          newKey = key
        else if key is "RecYards"
          newKey = "recYds"
        else if key is "Tm"
          newKey = "team"
        else
          newKey = key.charAt(0).toLowerCase() + key.slice(1)

        val = player[key]
        if not val?
          val = 0

        p[newKey] = val

      results.push( p )
    data = JSON.parse( JSON.stringify( results ) )

  setData : ( d ) ->
    data = d
  getData : ->
    return data

