express = require 'express'
app = express()

app.use express.logger(format:"dev")
app.use express.static('static')

app.use express.errorHandler()
app.locals.pretty = true

app.listen 3000
