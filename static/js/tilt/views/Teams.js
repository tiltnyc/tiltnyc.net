(function() {

  define(['text!/templates/teams.html'], function(template) {
    return Backbone.View.extend({
      render: function() {
        this.$el.html(template);
        return this;
      }
    });
  });

}).call(this);
