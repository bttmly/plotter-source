do ( App = window.Plotter ) ->

  App.ChartDrawer = do ->
  
    makeScales = ( vars, data ) ->
      return App.ScaleMaker( vars, data )

    drawChart = ( vars, data ) ->
      
      vars =
        xVar : App.settings.statToAbbr[ vars["x-var-select"] ]
        yVar : App.settings.statToAbbr[ vars["y-var-select"] ]
        rVar : App.settings.statToAbbr[ vars["size-var-select"] ]
        cVar : App.settings.statToAbbr[ vars["shade-var-select"] ]

      App.scales = scales = makeScales( vars, data )

      # temp, set in config elsewhere.
      chartHeight  = 400
      chartWidth   = 800
      chartPadding = 40

      posColors = Plotter.settings.posColors
      x = vars.xVar
      y = vars.yVar
      r = vars.rVar
      c = vars.cVar
    
      scatterplot = d3.select ".chart-pane"
        .append "svg"
        .attr "id", "d3-scatterplot"
      
      dotHolder = d3.select "#d3-scatterplot"
        .append "g"
        .attr "id", "dot-holder"
      
      scatterplotPoints = dotHolder.selectAll "circle"
        .data( data )
        .enter()
        .append "circle"
        .attr "cx", ( d ) ->
          return scales.x( d[x] )
        .attr "cy", ( d ) ->
          return scales.y( d[y] )
        .attr "r", ( d ) ->
          if scales.r and d[r]
            return scales.r( d[r] )
          else
            # 4px is fallback radius is no r var is defined
            return 4
        .attr "fill", ( d ) ->
          base = posColors[d.FantPos]
          if scales.c and d[c]
            if scales.c( d[c] ) > 0
              return Color( base )
                .lightenByAmount( scales.c(d[c]) )
                .desaturateByAmount( scales.c(d[c]) )
                .toCSS() 
            else
              return Color(base)
                .darkenByAmount( 0 - scales.c(d[c]) )
                .saturateByAmount( 0 - scales.c(d[c]) )
                .toCSS() 
          else
            return base
        # id format "FirstName-LastName_Season_Position"
        .attr "id", ( d ) ->
          id = ""
          id += d.name.split(" ").join("-").replace(/\./g, "").replace(/'/g, "") + "_"
          id += d.Season + "_"
          id += d.FantPos
          return id

        xAxis = d3.svg.axis()
          .scale(scales.x)
          .orient("bottom")
        
        yAxis = d3.svg.axis()
          .scale scales.y 
          .orient "left" 
        
        scatterplot.append "g" 
          .attr "class", "axis"
          .attr "id", "xAxis"
          .attr "transform", "translate( 0, #{chartHeight - chartPadding * 2} )"
          .call xAxis
        
        scatterplot.append "text"
          .attr "class", "xAxis-label"
          .attr "transform", "translate( #{chartPadding}, #{chartHeight + 30 - chartPadding * 2} )"
          .text x
        
        scatterplot.append "g"
          .attr "class", "axis"
          .attr "id", "yAxis"
          .attr "transform", "translate( #{chartPadding}, 0 )"
          .call yAxis 
        
        scatterplot.append "text"
          .attr "class", "yAxis-label"
          .attr "transform", "translate( #{chartPadding}, 0) rotate(-90)"
          .text y 
    
        # @s.els.chart = @s.els.chartWrapper.find "svg"
        # @s.els.dots = @s.els.chart.find "circle"
        
        # # add custom attributes to circles. Useful for highlight mode later.
        # for dot in @s.els.dots
        #   pieces = dot.id.split("_")
        #   $(dot).attr "data-player-name", pieces[0].split("-").join(" ") 
        #   $(dot).attr "data-player-season", pieces[1]
        #   $(dot).attr "data-player-position", pieces[2]
      
        # # need to use DOM element to set case-sentitive attributes
        # svgDomElement = @s.els.chartWrapper.find("svg")[0]
        # svgDomElement.setAttribute('preserveAspectRatio', 'xMinYMin meet')
        # svgDomElement.setAttribute("viewBox", "0 0 800 400")

        # this.s.els.chartWrapper
        #   .css("visibility", "visible")
        #   .css("width", "")

        # this.fixPlotHeight()

        # $plot = @s.els.chartWrapper.find("svg").eq(0)
        # @s.els.$log.fadeIn().css
        #   top : $plot.offset().top
        #   left : $plot.offset().left + $plot.width() - @s.els.$log.width()

        # fixPlotHeight : ->
        #   $plot = @s.els.chartWrapper.find("svg").eq(0)
        #   ratio = $plot.prop("viewBox").baseVal.height / $plot.prop("viewBox").baseVal.width
        #   $plot.parent().height(ratio * $plot.parent().width() )


    return drawChart