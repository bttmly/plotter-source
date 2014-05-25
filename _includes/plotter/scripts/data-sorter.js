// Generated by CoffeeScript 1.7.1
(function(App) {
  var __;
  __ = function(arr) {
    return new Collection(arr);
  };
  App.DataSorter = void 0;
  App.on("dataSetLoaded", function(event, data) {
    return App.DataSorter = __(data);
  });
  return App.on("requestRender", function(event, data) {
    var ppProp, seasons, sortArr, sortData;
    sortData = data;
    seasons = sortData.seasons.map(Number);
    ppProp = sortData.ppVal[0].length === 2 ? "fantPos" : "name";
    sortArr = [
      {
        prop: ppProp,
        vals: sortData.ppVal
      }, {
        prop: "season",
        vals: seasons
      }
    ];
    return App.ChartDrawer(sortData.vars, App.DataSorter.multiWhereArray(sortArr));
  });
})(window.Plotter);
