// Generated by CoffeeScript 1.7.1
(function() {
  var CONSTANTS;

  CONSTANTS = {
    ScaleMaker: function() {
      var cVals, datum, last, numericalSort, rVals, scaleVals, scales, v, xVals, yVals, _i, _len;
      numericalSort = function(a, b) {
        return a - b;
      };
      last = function(arr) {
        return arr[arr.length - 1];
      };
      xVals = dataSet.pluck(xVar).sort(numericalSort);
      yVals = dataSet.pluck(yVar).sort(numericalSort);
      rVals = dataSet.pluck(rVar).sort(numericalSort);
      cVals = dataSet.pluci(cVar).sort(numericalSort);
      scales = {};
      scaleVals = {
        x: {
          min: 1000000,
          max: 0
        },
        y: {
          min: 1000000,
          max: 0
        },
        r: {
          min: 1000000,
          max: 0
        },
        c: {
          min: 1000000,
          max: 0
        }
      };
      for (_i = 0, _len = data.length; _i < _len; _i++) {
        datum = data[_i];
        v = sel.variables;
        if (datum[v.xAxis] > scaleVals.x.max) {
          scaleVals.x.max = datum[v.xAxis];
        }
        if (datum[v.xAxis] < scaleVals.x.min) {
          scaleVals.x.min = datum[v.xAxis];
        }
        if (datum[v.yAxis] > scaleVals.y.max) {
          scaleVals.y.max = datum[v.yAxis];
        }
        if (datum[v.yAxis] < scaleVals.y.min) {
          scaleVals.y.min = datum[v.yAxis];
        }
        if (datum[v.rAxis] > scaleVals.r.max) {
          scaleVals.r.max = datum[v.rAxis];
        }
        if (datum[v.rAxis] < scaleVals.r.min) {
          scaleVals.r.min = datum[v.rAxis];
        }
        if (datum[v.cAxis] > scaleVals.c.max) {
          scaleVals.c.max = datum[v.cAxis];
        }
        if (datum[v.cAxis] < scaleVals.c.min) {
          scaleVals.c.min = datum[v.cAxis];
        }
      }
      scales.x = d3.scale.linear().domain([scaleVals.x.min, scaleVals.x.max]).range([chartPadding, chartWidth - chartPadding * 3]);
      scales.y = d3.scale.linear().domain([scaleVals.y.max, scaleVals.y.min]).range([chartPadding / 4, chartHeight - chartPadding * 2]);
      scales.r = d3.scale.linear().domain([scaleVals.r.min, scaleVals.r.max]).range([2, 10]);
      scales.c = d3.scale.linear().domain([scaleVals.c.min, scaleVals.c.max]).range([-0.15, 0.15]);
      return scales;
    }
  };

}).call(this);