(function() {

  define(['models/Event'], function(Event) {
    return Backbone.Collection.extend({
      url: "/events",
      populate: function(done) {
        var _this = this;
        return this.fetch({
          success: function() {
            return done(_this.splitByDate());
          }
        });
      },
      splitByDate: function(date) {
        var asJSON, m, result;
        if (date == null) date = new Date();
        asJSON = this.toJSON();
        return result = {
          before: (function() {
            var _i, _len, _results;
            _results = [];
            for (_i = 0, _len = asJSON.length; _i < _len; _i++) {
              m = asJSON[_i];
              if (new Date(m.date) < date) _results.push(m);
            }
            return _results;
          })(),
          after: (function() {
            var _i, _len, _results;
            _results = [];
            for (_i = 0, _len = asJSON.length; _i < _len; _i++) {
              m = asJSON[_i];
              if (new Date(m.date) >= date) _results.push(m);
            }
            return _results;
          })()
        };
      }
    });
  });

}).call(this);
