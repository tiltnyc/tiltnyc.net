define ['text!/templates/home.html'], (template) ->
  Backbone.View.extend
    render: ->
      @$el.html template
      @
    playVideo: (e) ->
      e.preventDefault()
      console.log 'Play!'
      $('#video-modal').modal()
    events: ->
      "click #video": "playVideo"