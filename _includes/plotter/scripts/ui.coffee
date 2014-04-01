# the application doesn't care about the state of these things.

# input-group togglers
do ->
  $( ".input-group" ).data( "plotter-open", true )

  togglers = $( ".input-group__toggle" )

  togglers.click ->
    inputGroup = $( this ).parent( ".input-group" )
    content = inputGroup.find( ".input-group__content" )
    
    # collapse it
    if inputGroup.data( "plotter-open" )
      content.slideUp()
      inputGroup
        .addClass( "input-group--collapsed" )
        .data( "plotter-open", false)

    # expand it
    else
      content.slideDown()
      inputGroup
        .removeClass( "input-group--collapsed" )
        .data( "plotter-open", true )

# navbar toggler
do ->
    navbar = $( ".navbar" )
    toggler = $( ".menu-toggle" )
    toggler.data( "plotter-menu-state",  )
    toggler.click ->
      $( this ).toggleClass( "menu-toggle--x" )

# player select
do ->
  playerSelect = $( ".input-select--players" )
  $.sub "dataset:complete", ( event, fullSet ) ->

    args = Array::slice.call( arguments )
    for arg in args
      console.log arg

    names = _.unique( fullSet.pluck("name").sort() )
    htmlStr = "<option></option>"
    for name in names
      htmlStr += "<option>"
      htmlStr += name
      htmlStr += "</option>"
    playerSelect.html( htmlStr ).chosen
      width: "100%"




