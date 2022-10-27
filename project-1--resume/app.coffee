
fs = require 'fs'
http = require 'http'
express = require 'express'
path = require 'path'
favicon = require 'serve-favicon'
morgan = require 'morgan'
cookieParser = require 'cookie-parser'
bodyParser = require 'body-parser'
cors = require 'cors'
# sectionRoutes = require './routes/sections'
testRoutes = require './routes/tests'

port = 9500
app = express()

app.set 'views', path.join(__dirname, 'views')
app.set 'view engine', 'jade'
app.set 'port', process.env.PORT or port

app.use cors()
app.use favicon(__dirname + '/public/favicon.ico')
app.use morgan 'dev'
app.use bodyParser.json()
app.use bodyParser.urlencoded extended: false
app.use cookieParser()
app.use express.static path.join(__dirname, 'public')


app.use '/tests', testRoutes


# 404
app.use (req, res, next) ->
  err = new Error('Not Found')
  err.status = 404
  next err

# error handler
app.use (err, req, res, next) ->
  if err.status and err.status is 404
    res.render 'errors/404'

  
server = http.createServer app

server.listen app.get('port'), ->
  console.log 'listening on port ' + app.get('port')
