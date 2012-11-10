(function() {

  define(["./views/Home", "./views/Events", "./views/Teams", "./views/Social"], function(Home, Events, Teams, Social) {
    return Backbone.Router.extend({
      routes: {
        ":name/:action": "goto",
        ":name": "goto",
        "": "goto"
      },
      initialize: function(options) {
        return this.views = {
          home: Home,
          events: Events,
          social: Social
        };
      },
      goto: function(name, action) {
        var klazz, _ref;
        klazz = (_ref = this.views[name]) != null ? _ref : this.views.home;
        return this.trigger('viewChange', klazz, name, action);
      }
    });
  });

}).call(this);
