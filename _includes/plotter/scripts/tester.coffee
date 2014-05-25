do ( App = window.Plotter ) ->

  q = ( i ) ->
      document.querySelector( i )

  App.selectTest = ->
    q( "#ppSwitchPosition" ).checked = true
    q( "#gsSwitchSeason" ).checked = true
    q( "#check-rb" ).checked = true
    q( "#check-wr" ).checked = true
    q( "#check-2008" ).checked = true
    q( "#check-2009" ).checked = true
    q( "#check-2010" ).checked = true
    q( "#check-2011" ).checked = true
    q( "#check-2012" ).checked = true
    q( "#check-2013" ).checked = true
    q( "#y-var-select option[data-stat='FantPt']" ).selected = true
    q( "#x-var-select option[data-stat='PosRank']" ).selected = true
    q( "#size-var-select option[data-stat='TotalTD']" ).selected = true
    q( "#shade-var-select option[data-stat='ScrimYds']" ).selected = true

    $("#x-var-select").trigger("chosen:updated")
    $("#y-var-select").trigger("chosen:updated")
    $("#size-var-select").trigger("chosen:updated")
    $("#shade-var-select").trigger("chosen:updated")

  App.selectTest()