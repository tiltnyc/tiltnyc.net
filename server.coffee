express = require 'express'
app = express()

app.use express.logger(format:"dev")
app.use express.static('static')

#require('./routes')(app)

app.use express.errorHandler()
app.locals.pretty = true

port = process.env.PORT || 3000
app.listen port