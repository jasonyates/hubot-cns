# Description:
#   Hubot plugin to integrate with cNS Team
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot devices <sitename> - Gets a list of devices in a site

module.exports = (robot) ->

  robot.respond /pug me/i, (msg) ->
    msg.http("http://pugme.herokuapp.com/random")
      .get() (err, res, body) ->
        msg.send JSON.parse(body).pug
