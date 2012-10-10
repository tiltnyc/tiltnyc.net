(function() {

  define(['text!/templates/social.html'], function(template) {
    return Backbone.View.extend({
      render: function() {
        this.$el.html(template);
        return this;
      }
    });
  });

}).call(this);
