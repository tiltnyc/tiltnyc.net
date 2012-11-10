(function() {

  define(['text!/templates/header.html'], function(template) {
    return Backbone.View.extend({
      render: function() {
        this.$el.html(template);
        return this;
      },
      highlight: function(section) {
        if (section == null) section = "";
        return this.$('.nav li a').each(function(i, li) {
          if ($(li).attr('href').slice(1).toLowerCase() !== section) {
            return $(li).removeClass('active');
          } else {
            return $(li).addClass('active');
          }
        });
      }
    });
  });

}).call(this);
