express = require 'express'
app = express()

app.use express.static('static')

app.listen 3000

###
connect = require('connect')

connect()
  .use( connect.logger() )
  .use( connect.static( __dirname + '/static/') )
  .use "get", (req, res) ->

  .listen 3000 
  ###