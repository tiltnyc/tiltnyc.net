Faker = require 'Faker'
crypto = require 'crypto'

key = 'abcdef'
i = 10
genId = () -> crypto.createHmac('md5', key).update((i++).toString()).digest('hex')

events = 
[
  _id: genId()
  name: "fall 2012"
  theme: "unknown"
  date: new Date(2012,8,29)
  description: Faker.Lorem.paragraph()
,
  _id: genId()
  name: "spring 2012"
  theme: "nyc rental market"
  date: new Date(2012,3,21)
  description: Faker.Lorem.paragraph()
]

teams = []

events.forEach (e) ->
  t = Faker.Helpers.randomNumber 10
  e.teams = ({_id: genId(), name: Faker.Company.companyName(), event: e._id, competitors: []} for i in [0..t])
  teams = teams.concat e.teams

users = []
numUsers = Faker.Helpers.randomNumber 50
for i in [0..numUsers]
  users.push 
    _id: genId()
    username: Faker.Internet.userName()
    name: Faker.Name.findName()

competitors = []
events.forEach (e) ->
  c = Faker.Helpers.randomNumber users.length - 1
  for i in [0..c]
    team = Faker.Helpers.randomize e.teams
    competitors.push
      _id: genId()
      user: users[i]
      event: e._id
      team: team._id
    team.competitors.push competitors.slice(-1)

events.forEach (e) -> e.rounds = ({_id:genId(), number: i+1, event: e._id} for i in [0..2])

events.forEach (e) -> 
  e.results = []
  e.rounds.forEach (r) ->
    e.teams.forEach (t) ->
      e.results.push 
        _id: genId()
        round: r._id
        roundNumber: r.number
        team: t._id
        teamName: t.name
        before_price: (Math.random() * 4).toPrecision(3)
        after_price: (Math.random() * 4).toPrecision(3)


send = (res, data) ->
  res.contentType 'application/json'
  res.send(JSON.stringify data)

module.exports = (app) ->
  app.get "/events", (req, res) -> send res, events
  
  app.param "eid", (req, res, next, id) ->
    events.forEach (e) -> req.event = e if e._id is id
    next()

  app.get "/event/:eid/teams", (req, res) -> send res, req.event.teams    

  app.get "/event/:eid/rounds", (req, res) -> send res, req.event.rounds    

  app.get "/event/:eid/results", (req, res) -> send res, req.event.results    
  
  app.get "/teams", (req, res) -> send res, teams

  app.get "/users", (req, res) -> send res, users

  app.get "/competitors", (req, res) -> send res, competitors
