class InputBase
  constructor : ( el ) ->
    this.el = el

  value : ->
    if arguments.length
      return this._setValue( arguments )
    else
      return if this._hasValue() then this.el.value else false

  isFocused : ->
    return document.activeElement is this.el

  _hasValue : ->
    return !!this.el.value

  _setValue : ( value ) ->
    return ( this.el.value = value )

["addEventListener", "dispatchEvent", "removeEventListener"].forEach ( method ) ->
  InputBase::[method] =
    EventTarget::[method].apply( this.el, arguments )

class InputComponent extends InputBase
  constructor : ( el ) ->
    super( el )

class CheckComponent extends InputBase
  constructor : ( el ) ->
    super( el )

  checked : this.el.checked

  value : ->
    if arguments.length
      this._setValue( arguments )
    else
      return if this.checked then super() else return false

  toggle : ->
    this.chcked = !this.checked

class SelectComponent extends InputBase
  constructor : ( el ) ->
    super( el ) 

  value : ->
    return ( option.value for option in this.selected() )

  selected : ->
    return Array.prototype.filter.call this.el.querySelectorAll( "options" ), ( option ) ->
      return option.selected

class InputGroup
  constructor : ( selector ) ->
    els = document.querySelectorAll( selector )
    this.inputs = []
    for el, i in els
      this.inputs.push InputMaker( els.item( i ) )
    return this.inputs

  values : ->
    input.value() for input in this.inputs

  formatInputs : ( inputs ) ->
    if inputs instanceof NodeList
      return inputs
    else if window.jQuery and inputs instanceof jQuery
      return jQuery.makeArray( inputs )

InputMaker = ( el ) ->
  switch el.tagName.toLowerCase()
    when "input"
      if el.type is "radio" or el.type is "checkbox"
        return new CheckComponent( el )
      else
        return new InputComponent( el )
    when "select"
      return new SelectComponent( el )
    else
      console.warn( "Invalid element passed to InputMaker" ) 
      return false




