define ['text!/templates/events.html'], (template) ->
  Backbone.View.extend
    render: ->
      @$el.html template
      @