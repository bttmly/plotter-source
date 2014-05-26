# https://github.com/bgrins/devtools-snippets/blob/master/snippets/console-save/console-save.js
do ( console ) ->
  console.save = ( data, filename = "console.json" ) ->
    unless data
      console.error "Console.save: No data!"
      return
    if typeof data is "object"
      data = JSON.stringify( data, undefined, 4 )
    blob = new Blob( [data], type: "text/json" )
    e = document.createEvent( "MouseEvents" )
    a = document.createElement( "a" )
    a.download = filename
    a.href= window.URL.createObjectURL( blob )
    a.dataset.downloadurl = ["text/json", a.download, a.href].join( ":" )
    e.initMouseEvent( "click", true, false, window, 0, 0, 0, 0, 0, false, false, false, false, 0, null )
    a.dispatchEvent( e )