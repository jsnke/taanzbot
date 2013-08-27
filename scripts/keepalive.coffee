# Description:
#   Utility commands surrounding Hubot uptime.
#
# Commands:
#   hubot stay alive - Try keep hubot alive

stayingalive = false

module.exports = (robot) ->
  robot.respond /(stay alive$/i, (msg) ->
    if stayingalive
      msg.send 'Already staying alive.'
    else
      startKeepAlive msg, (text) ->
        msg.send text

stayingalive = false

startKeepAlive = (msg, text) ->
  setInterval () ->
    http = require 'http'
    http.get 'http://taanzbot.herokuapp.com/'
    , (err, res, body) ->
      console.log 'self-ping'
  , 120000
  stayingalive = true
  text 'Turned on the bot-prod.'
