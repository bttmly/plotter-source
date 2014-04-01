CONSTANTS = 
  r :
    min: 2
    max: 10
  c :
    min: -.15
    max: .15

ScaleMaker : (  ) ->

    numericalSort = ( a, b ) ->
      return a - b

    last = ( arr ) ->
      return arr[ arr.length - 1 ]

    scales = {}

    xVals = dataSet.pluck( xVar ).sort( numericalSort )
    yVals = dataSet.pluck( yVar ).sort( numericalSort )
    rVals = dataSet.pluck( rVar ).sort( numericalSort )
    cVals = dataSet.pluci( cVar ).sort( numericalSort )

    scales =
      x : d3.scale.linear().domain( [ xVals[0], last(xVals) ] ) #.range( [ chartPadding, chartWidth - chartPadding * 3 ] )
      y : d3.scale.linear().domain( [ yVals[0], last(yVals) ] ) #.range( [ chartPadding, chartHeight - chartPadding * 2 ] )
      r : d3.scale.linear().domain( [ rVals[0], last(rVals) ] ).range( [CONSTANTS.r.min, CONSTANTS.r.max] )
      c : d3.scale.linear().domain( [ cVals[0], last(cVals) ] ).range( [CONSTANTS.c.min, CONSTANTS.c.max] )

    return scales
  