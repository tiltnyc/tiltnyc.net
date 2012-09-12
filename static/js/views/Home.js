(function() {

  define(['text!/templates/home.html'], function(template) {
    return Backbone.View.extend({
      render: function() {
        this.$el.html(template);
        return this;
      }
    });
  });

}).call(this);
