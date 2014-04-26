do ( App = window.Plotter ) ->

  App.ScaleMaker = do ->

    CONSTANTS = 
      r :
        min: 2
        max: 10
      c :
        min: -.15
        max: .15

    numericalSort = ( a, b ) ->
      return a - b

    last = ( arr ) ->
      return arr[ arr.length - 1 ]

    scaleValues = ( vars, data ) ->

        xVals = data.pluck( vars.xVar ).sort( numericalSort )
        yVals = data.pluck( vars.yVar ).sort( numericalSort )
        rVals = data.pluck( vars.rVar ).sort( numericalSort )
        cVals = data.pluck( vars.cVar ).sort( numericalSort )

        scales = do ->
          x : d3.scale.linear().domain( [ xVals[0], last(xVals) ] ).range( [ App.settings.chart.padding, App.settings.chart.width - App.settings.chart.padding ] )
          y : d3.scale.linear().domain( [ last(yVals), yVals[0] ] ).range( [ App.settings.chart.padding, App.settings.chart.height - App.settings.chart.padding ] )
          r : d3.scale.linear().domain( [ rVals[0], last(rVals) ] ).range( [CONSTANTS.r.min, CONSTANTS.r.max] )
          c : d3.scale.linear().domain( [ cVals[0], last(cVals) ] ).range( [CONSTANTS.c.min, CONSTANTS.c.max] )    

    return scaleValues