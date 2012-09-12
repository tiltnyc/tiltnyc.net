define ['text!/templates/header.html'], (template) ->
  Backbone.View.extend
    render: ->
      @$el.html template
      @