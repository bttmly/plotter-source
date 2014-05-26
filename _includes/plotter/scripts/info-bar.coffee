do ( App = window.Plotter ) ->

  infoBar = $( ".chart-info-bar" )
  dotHolder = $( "#dot-holder" )

  render = ( d ) ->
    """
      <span class='player-name'>#{ d.name }</span>
      <span class='player-season'>#{ d.season }</span>
      <span class='player-position'>#{ d.position }</span>
    """

  renderInfo = ( dot ) ->
    dot = $( dot )

    playerData = 
      name: dot.data( "player-name" )
      position: dot.data( "player-position" )
      season: dot.data( "player-season" )

    markup = render( playerData )

    infoBar.empty().html( markup )

  $( "body" ).on "mouseenter", ".scatterplot-point", ( evt ) ->
    $( this ).data "real-r", $( this ).data( "r" )
    console.log $( this ).data( "real-r" )
    renderInfo( this )
  
  $( "body" ).on "mouseleave", ".scatterplot-point", ( evt ) ->
    infoBar.empty()
