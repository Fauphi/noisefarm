#!/bin/bash

APPNAME=<%= appName %>
APP_PATH=/opt/$APPNAME
BUNDLE_PATH=$APP_PATH/current
ENV_FILE=$APP_PATH/config/env.list
PORT=<%= port %>
USE_LOCAL_MONGO=<%= useLocalMongo? "1" : "0" %>

# Remove previous version of the app, if exists
docker rm -f $APPNAME

# Remove frontend container if exists
docker rm -f $APPNAME-frontend

# We don't need to fail the deployment because of a docker hub downtime
set +e
docker pull meteorhacks/meteord:base
set -e

if [ "$USE_LOCAL_MONGO" == "1" ]; then
  docker run \
    -d \
    --restart=always \
    --publish=$PORT:80 \
    --volume=$BUNDLE_PATH:/bundle \
    --env-file=$ENV_FILE \
    --link=mongodb:mongodb \
    --hostname="$HOSTNAME-$APPNAME" \
    --env=MONGO_URL=mongodb://mongodb:27017/$APPNAME \
    --name=$APPNAME \
    atticstudio/noisefarm-meteor-sox:base3
#    meteorhacks/meteord:base
else
  docker run \
    -d \
    --restart=always \
    --publish=$PORT:80 \
    --volume=$BUNDLE_PATH:/bundle \
    --hostname="$HOSTNAME-$APPNAME" \
    --env-file=$ENV_FILE \
    --name=$APPNAME \
    atticstudio/noisefarm-meteor-sox:base3
#    meteorhacks/meteord:base
  docker exec -it noisefarm-live sh -c 'set -e && cd /usr/local/share/ && curl -L -O https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 && tar xjf phantomjs-2.1.1-linux-x86_64.tar.bz2 && ln -s -f /usr/local/share/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/share/phantomjs && ln -s -f /usr/local/share/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin/phantomjs && ln -s -f /usr/local/share/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/bin/phantomjs && rm phantomjs-2.1.1-linux-x86_64.tar.bz2 && phantomjs --version'
fi

<% if(typeof sslConfig === "object")  { %>
  # We don't need to fail the deployment because of a docker hub downtime
  set +e
  docker pull meteorhacks/mup-frontend-server:latest
  set -e
  docker run \
    -d \
    --restart=always \
    --volume=/opt/$APPNAME/config/bundle.crt:/bundle.crt \
    --volume=/opt/$APPNAME/config/private.key:/private.key \
    --link=$APPNAME:backend \
    --publish=<%= sslConfig.port %>:443 \
    --name=$APPNAME-frontend \
    meteorhacks/mup-frontend-server /start.sh
<% } %>
