define ['models/Event'], (Event) ->
  Backbone.Collection.extend
    #model: Event
    url: "/events"

    populate: (done) ->
      @fetch
        success: () => done @splitByDate()

    splitByDate: (date = new Date()) ->
      asJSON = @toJSON()
      result =  
        before: (m for m in asJSON when new Date(m.date) < date)
        after: (m for m in asJSON when new Date(m.date) >= date)