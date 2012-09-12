(function() {

  require.config({
    paths: {
      text: '/js/3rd/require.text'
    },
    baseUrl: '/js'
  });

  define(['./Router', './views/Header'], function(Router, Header) {
    new Header({
      el: 'body'
    }).render();
    new Router().on('viewChange', function(klazz, name, action) {
      return new klazz({
        el: '#main-content'
      }).render();
    });
    return Backbone.history.start();
  });

}).call(this);
