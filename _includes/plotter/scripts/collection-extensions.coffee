compare = ( val1, comp, val2 ) ->
  return switch comp
    when "==="
      return val1 is val2
    when "!=="
      return val1 isnt val2
    when ">"
      return val1 > val2
    when ">="
      return val1 >= val2
    when "<"
      return val1 < val2
    when "<="
      return val1 <= val2

# filter a collection by checking if each element[prop] value is in the passed array
Collection::whereArray = ( prop, vals ) ->
  switch Plotter.util.typeCheck( arr )
    when "string"
      vals = [vals]
    when "array"
      break
    else
      throw new Error "Collection::whereArr requires a string or array as its second argument."

  results = []
  for element in this
    if element[prop]
      results.push( element ) if element[prop] in vals
  return new Collection( results )


# opts = [
#   { prop: "propA",
#     vals: ["val1", "val2"] },
#   { prop: "propB",
#     vals: ["val3", "val4"] }
# ]
Collection::multiWhereArray = ( opts ) ->
  results = this
  for opt in opts
    results = Collection::whereArray.apply( results, [ opt.prop, opt.vals ] )
  return results

# opts = [
#   { prop: "passYds",
#     comp: ">="
#     val: 3000 },
#   { prop: "age",
#     comp: "<"
#     val: 28 }
# ]
Collection::dynamicFilter = ( opts ) ->
  results = this
  for opt in opts
    results = results.filter ( el ) ->
      return compare( el[opt.prop], opt.comp, opt.val )
  return Collection( results )






