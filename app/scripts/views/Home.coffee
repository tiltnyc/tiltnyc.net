define ['text!./home.html'], (template) ->
  Backbone.View.extend
    render: ->
      @$el.html template
      @