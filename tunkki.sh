#!/bin/bash
export HUBOT_IRC_SERVER=tampere.fi.b2irc.net
export HUBOT_IRC_ROOMS="#mansecon.tekniikka"
export HUBOT_IRC_NICK="tunkki"
export HUBOT_IRC_UNFLOOD="true"
export PORT=8080

echo ""
echo "Starting bot"
bin/hubot -a irc --name tunkki
