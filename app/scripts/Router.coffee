define [
  "./views/Home",
  "./views/Events"
  "./views/Teams"
], (Home, Events, Teams) ->
  Backbone.Router.extend

    routes:
      ":name/:action":  "goto"
      ":name":  "goto"
      "": "goto"

    initialize: (options) ->
      @views =
        home: Home
        events: Events
        teams: Teams

    goto: (name, action) ->
      klazz = @views[name] ? @views.home
      @trigger 'viewChange', klazz, name, action