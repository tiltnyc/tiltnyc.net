define [
  "./views/Home",
  "./views/Events"
  "./views/Teams"
  "./views/Social"
], (Home, Events, Teams, Social) ->
  Backbone.Router.extend

    routes:
      ":name/:action":  "goto"
      ":name":  "goto"
      "": "goto"

    initialize: (options) ->
      @views =
        home: Home
        #events: Events
        #teams: Teams
        social: Social

    goto: (name, action) ->
      klazz = @views[name] ? @views.home
      @trigger 'viewChange', klazz, name, action