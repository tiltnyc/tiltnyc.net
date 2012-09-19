(function() {

  define(['text!/templates/header.html'], function(template) {
    return Backbone.View.extend({
      render: function() {
        this.$el.html(template);
        return this;
      }
    });
  });

}).call(this);
