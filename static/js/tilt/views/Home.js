(function() {

  define(['text!/templates/home.html'], function(template) {
    return Backbone.View.extend({
      render: function() {
        this.$el.html(template);
        return this;
      },
      playVideo: function(e) {
        e.preventDefault();
        console.log('Play!');
        return $('#video-modal').modal();
      },
      events: function() {
        return {
          "click #video": "playVideo"
        };
      }
    });
  });

}).call(this);
