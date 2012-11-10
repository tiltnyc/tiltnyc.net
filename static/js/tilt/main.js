(function() {

  require.config({
    paths: {
      text: '/js/3rd/require.text'
    },
    baseUrl: '/js/tilt'
    /*shim:
      underscore:
        exports: '_'
      backbone:
        deps: ['underscore']
        exports: 'Backbone'
    */
  });

  define(['./Router', './views/Header'], function(Router, Header) {
    var header;
    header = new Header({
      el: 'body'
    }).render();
    new Router().on('viewChange', function(klazz, name, action) {
      new klazz({
        el: '#main-content'
      }).render();
      return header.highlight(name);
    });
    return Backbone.history.start();
  });

}).call(this);
