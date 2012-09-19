(function() {

  require.config({
    paths: {
      text: '/js/3rd/require.text',
      underscore: '/js/3rd/underscore',
      backbone: '/js/3rd/backbone'
    },
    baseUrl: '/js/tilt',
    shim: {
      underscore: {
        exports: '_'
      },
      backbone: {
        deps: ['underscore'],
        exports: 'Backbone'
      }
    }
  });

  define(['backbone', './Router', './views/Header'], function(Backbone, Router, Header) {
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
