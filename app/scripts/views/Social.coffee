define ['text!/templates/social.html'], (template) ->
  Backbone.View.extend
    render: ->
      @$el.html template
      @