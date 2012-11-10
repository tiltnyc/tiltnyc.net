define ['text!/templates/header.html'], (template) ->
  Backbone.View.extend
    render: ->
      @$el.html template
      @

    highlight: (section) ->
      section ?= ""
      @$('.nav li a').each (i, li) -> 
        if $(li).attr('href').slice(1).toLowerCase() isnt section then $(li).removeClass('active') else $(li).addClass('active')