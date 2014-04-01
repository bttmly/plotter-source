# Only this file touches the controls interface

# this is the only object that should be collecting data from DOM elements.

Plotter.InputCollector = do ->

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

    # UI prep; disable buttons
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
      # validate & enable render button here


