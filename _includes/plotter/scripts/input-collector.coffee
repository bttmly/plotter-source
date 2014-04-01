# this is the only object that should be collecting data from DOM elements.
Plotter.InputCollector = do ->

  valid = true

  $cache = do ->
    seasons : $( "#input-group--seasons .check__input" )
    positions: $( "#input-group--positions .check__input" )
    variables: $( "#input-group--variables .input-select" )
    players: $( "#input-group--players .input-select")
    ppSwitch: $( "#input-group--pp-switch .switch-input" )
    gsSwitch: $( "#input-group--gs-switch .switch-input" )

  inputValues =
    seasons : []
    position: []
    variables: []
    players: []
    ppSwitch: false
    ppSwitch: false

  update = ->
    return this

  validate = ->
    # should throw messages to some event handling system when something fails validation

  values = ->
    return this.inputValues

  return {
    update : update
    validate : validate
    values : values
  }