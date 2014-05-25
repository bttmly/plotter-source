Plotter.util = do ->

   typeCheck : do ->
    classToType =
      '[object Boolean]': 'boolean'
      '[object Number]': 'number'
      '[object String]': 'string'
      '[object Function]': 'function'
      '[object Array]': 'array'
      '[object Date]': 'date'
      '[object RegExp]': 'regexp'
      '[object Object]': 'object'
    ( obj ) ->
      if obj == undefined or obj == null
        return String( obj )
      classToType[ Object.prototype.toString.call( obj ) ]