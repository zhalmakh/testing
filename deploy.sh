#!/bin/bash

DOKKU_HOST=dokku.fabyo.net
DOKKU_APP=devnots-api

eval "$(ssh-agent -s)"
chmod 600 ./deploy.key
ssh-add ./deploy.key
ssh-keyscan $DOKKU_HOST >> ~/.ssh/known_hosts
git remote add dokku dokku@"$DOKKU_HOST":"$DOKKU_APP"
git push dokku master -f
