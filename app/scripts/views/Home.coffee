define ['text!/templates/home.html'], (template) ->
  Backbone.View.extend
    render: ->
      @$el.html template
      @