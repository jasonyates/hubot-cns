# Description:
#   Hubot plugin to integrate with cNS Team
#
# Dependencies:
#   None
#
# Configuration:
#   HUBOT_CNS_HOST
#   HUBOT_CNS_API_KEY
#
# Commands:
#   hubot site <site code> - Gets information about a cNS managed site given a site code


module.exports = (robot) ->
  robot.respond /site (.*)/i, (msg) ->
    msg
      .http(process.env.HUBOT_CNS_HOST + "/api/hubotsite/code/" + msg.match[1])
      .headers('X-API-KEY': process.env.HUBOT_CNS_API_KEY)
      .get() (err, res, body) ->
        resp = "";
        results = JSON.parse(body)
        if results.error
          results.error.errors.forEach (err) ->
            resp += err.message
        else
        	msg.send results.data