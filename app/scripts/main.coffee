require.config
  paths: 
    text: '/js/3rd/require.text'
  baseUrl: '/js/compiled'

define ['./Router', './views/Header'], (Router, Header) ->
  new Header
    el: 'body'
  .render()

  new Router().on 'viewChange', (klazz, name, action) ->
    new klazz
      el: '#main-content'
    .render()  
    
  Backbone.history.start()