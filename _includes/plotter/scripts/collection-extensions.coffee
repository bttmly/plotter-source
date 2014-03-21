# filter a collection by checking if each element[prop] value is in the passed array
Collection::propCheckArr = ( prop, arr, returnCollection = true ) ->
  switch Plotter.util.typeCheck( arr )
    when "string"
      arr = [arr]
    when "array"
      break
    else
      throw new Error "Collection::propCheckArr requires a string or array as its second argument."

  for element in this
    if element[prop]
      results.push( element ) if element[prop] in arr
  return if returnCollection then new Collection( results ) else results



