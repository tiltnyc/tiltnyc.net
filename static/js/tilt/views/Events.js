(function() {

  define(['text!/templates/events.html', 'collections/Events'], function(template, Events) {
    return Backbone.View.extend({
      initialize: function() {
        return this.allEvents = new Events();
      },
      render: function() {
        var _this = this;
        this.allEvents.populate(function(events) {
          return _this.$el.html(_.template(template, {
            upcoming: events.after,
            past: events.before
          }));
        });
        return this;
      }
    });
  });

}).call(this);
