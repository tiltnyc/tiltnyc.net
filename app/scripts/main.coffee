require.config
  paths: 
    text: '/js/3rd/require.text'
    underscore: '/js/3rd/underscore.min'
    backbone: '/js/3rd/backbone.min'
  baseUrl: '/js/tilt'    
  shim:
    underscore:
      exports: '_'
    backbone:
      deps: ['underscore']
      exports: 'Backbone'

define ['backbone', './Router', './views/Header'], (Backbone, Router, Header) ->
  new Header
    el: 'body'
  .render()

  new Router().on 'viewChange', (klazz, name, action) ->
    new klazz
      el: '#main-content'
    .render()  

  Backbone.history.start()