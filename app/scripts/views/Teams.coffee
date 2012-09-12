define ['text!/templates/teams.html'], (template) ->
  Backbone.View.extend
    render: ->
      @$el.html template
      @