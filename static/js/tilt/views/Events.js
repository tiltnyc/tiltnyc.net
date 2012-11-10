(function() {

  define(['text!/templates/events.html', 'collections/Events'], function(template, Events) {
    return Backbone.View.extend({
      initialize: function() {
        return this.allEvents = new Events();
      },
      render: function() {
        this.$el.html(_.template(template));
        return this;
      }
    });
  });

}).call(this);
