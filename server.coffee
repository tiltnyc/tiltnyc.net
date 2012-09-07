connect = require('connect')

connect()
  .use( connect.logger() )
  .use( connect.static( __dirname + '/static/') )
  .listen 3000 