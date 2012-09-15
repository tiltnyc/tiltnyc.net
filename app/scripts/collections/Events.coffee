define ['models/Event'], (Event) ->
  Backbone.Collection.extend
    #model: Event
    url: "/events"

    populate: (done) ->
      @fetch
        success: () => done @splitByDate()

    splitByDate: (date = new Date()) ->
      result =  
        before: (m for m in @models when new Date(m.get("date")) < date)
        after: (m for m in @models when new Date(m.get("date")) >= date)