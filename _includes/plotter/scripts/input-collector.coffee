do ( App = window.Plotter ) ->

  $ ->

    $$ = Controls

    appControls = [
      playerPositionSwitch = $$( "#input-group--pp-switch" )
      gameSeasonSwitch = $$( "#input-group--gs-switch" )
      positions = $$( "#input-group--positions" )
      players = $$( "#input-group--players" )
      variables = $$( "#input-group--variables" )
      seasons = $$( "#input-group--seasons" )
      renderButton = $$( "#control-button--render" )
      highlightButton = $$( "#control-button--highlight" )
    ]
    Plotter.controls = $$( appControls )


    # this is fucking horrible. Interim fix until the controls.js API gets sorted out.
    Plotter.controls.formattedValues = ->
      ret = {}
      valid = true

      if ( ppVal = playerPositionSwitch.value()?[0]?.val )
        if ppVal is "positions"
          ret.ppVal = positions.value().map ( obj ) ->
            return obj.val
        else if ppVal is "players"
          ret.ppVal = _.flatten players.value().map ( obj ) ->
            return obj.val
      else
        valid = false

      if ( seasonVal = seasons.value() )
        ret.seasons = seasonVal.map ( obj ) ->
          return obj.val
      else
        valid = false

      if ( varVal = variables.value() )
        ret.vars = {}
        for v in varVal
          ret.vars[ v.id ] = v.val[0]
        # if  !ret.vars[ "x-var-select" ] or !!ret.vars[ "y-var-select" ]
        #   valid = false
      else
        valid = false

      unless ( ret.gsVal = gameSeasonSwitch.value()?[0]?.val )
        valid = false

      return if not valid then valid else ret







    # UI prep; disable buttons
    # need to refactor this out of this file
    renderButton.on "click", ( event ) ->
      App.trigger "requestRender", Plotter.controls.formattedValues()

    renderButton.disabled( true )
    highlightButton.disabled( true )

    # UI prep; hide pos/player controls until user picks one
    $( "#input-group--players" ).hide()
    $( "#input-group--positions" ).hide()
    playerPositionSwitch.on "change", ( event ) ->
      value = this.value()[0].val
      if value is "players"
        $( "#input-group--players" ).slideDown()
        $( "#input-group--positions" ).slideUp()
      else
        $( "#input-group--positions" ).slideDown()
        $( "#input-group--players" ).slideUp()

    
    Plotter.controls.on "change", ( event ) ->
      if Plotter.controls.formattedValues()
        renderButton.disabled( false )



