# this is the only object that should be collecting data from DOM elements.
Plotter.InputCollector = do ->

  $$ = Controls

  appControls = []

  appControls.push playerPositionSwitch = $$( "#input-group--pp-switch" )
  appControls.push gameSeasonSwitch = $$( "#input-group--gs-switch" )

  appControls.push positions = $$( "#input-group--positions" )
  appControls.push players = $$( "#input-group--players" )

  appControls.push variables = $$( "#input-group--variables" )
  appControls.push seasons = $$( "#input-group--seasons" )

  appControls.push renderButton = $$( "#control-button--render" )
  appControls.push highlightButton = $$( "#control-button--highlight" )

  appControls = $$( appControls )
  