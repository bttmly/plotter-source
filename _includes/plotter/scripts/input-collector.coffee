do ( App = window.Plotter ) ->

  $ ->

    $$ = Controls

    Plotter.appControls = [
      playerPositionSwitch = $$( "#input-group--pp-switch" )
      gameSeasonSwitch = $$( "#input-group--gs-switch" )
      positions = $$( "#input-group--positions" )
      players = $$( "#input-group--players" )
      variables = $$( "#input-group--variables" )
      seasons = $$( "#input-group--seasons" )
      renderButton = $$( "#control-button--render" )
      highlightButton = $$( "#control-button--highlight" )
    ]
    Plotter.controls = $$( Plotter.appControls )


    # this is fucking horrible. Interim fix until the controls.js API gets sorted out.
    Plotter.controls.formattedValues = ->
      ret = {}
      valid = true

      if ( ppVal = playerPositionSwitch.value().first() )
        if ppVal is "positions"
          ret.ppVal = positions.value().valueArray()
        else if ppVal is "players"
          ret.ppVal = players.value().valueArray()
      else
        valid = false

      if seasons.value().length
        ret.seasons = seasons.value().valueArray()
      else
        valid = false

      if variables.value().length
        ret.vars = variables.value().idValuePair()
      else
        valid = false

      unless ( ret.gsVal = gameSeasonSwitch.value().first() )
        valid = false

      console.log( ret )

      return if not valid then valid else ret





    # UI prep; disable buttons
    # need to refactor this out of this file
    renderButton.on "click", ( event ) ->
      App.trigger "requestRender", Plotter.controls.formattedValues()

    # renderButton.disabled( true )
    highlightButton.disabled( true )

    # UI prep; hide pos/player controls until user picks one
    $( "#input-group--players" ).hide()
    $( "#input-group--positions" ).hide()
    playerPositionSwitch.on "change", ( event ) ->
      value = this.value().first()
      if value is "players"
        $( "#input-group--players" ).slideDown()
        $( "#input-group--positions" ).slideUp()
      else
        $( "#input-group--positions" ).slideDown()
        $( "#input-group--players" ).slideUp()

    
    Plotter.controls.on "change", ( event ) ->
      if Plotter.controls.formattedValues()
        renderButton.disabled( false )



