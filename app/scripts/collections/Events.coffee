define ['/models/Event'], (Event) ->
  Backbone.Collection.extend
    model: Event
    url: "/events"