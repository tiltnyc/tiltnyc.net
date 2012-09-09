define ['text!./events.html'], (template) ->
  Backbone.View.extend
    render: ->
      @$el.html template
      @