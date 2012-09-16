define ['text!/templates/events.html', 'collections/Events'], (template, Events) ->
  Backbone.View.extend
    initialize: ->
      @allEvents = new Events()

    render: ->
      #TODO: cache this rather than render each time
      @allEvents.populate (events) =>
        @$el.html _.template(template, {upcoming: events.after, past: events.before})
      @