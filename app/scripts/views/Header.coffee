define ['text!./header.html'], (template) ->
  Backbone.View.extend
    render: ->
      @$el.html template
      @