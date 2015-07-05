module.exports = (robot) ->
  robot.hear /(\w{2,}-\d+)/, (msg) ->
    channel = "#mansecon.tekniikka"
    ticket = escape(msg.match[1])
    robot.messageRoom channel, "https://jira.tracon.fi/browse/" + ticket.toUpperCase()
