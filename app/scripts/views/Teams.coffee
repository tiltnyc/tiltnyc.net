define ['text!./teams.html'], (template) ->
  Backbone.View.extend
    render: ->
      @$el.html template
      @