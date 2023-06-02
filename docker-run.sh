#!/bin/bash

GALLERY__MYSQL__HOST=${GALLERY__MYSQL__HOST:=localhost}
GALLERY__MYSQL__PORT=${GALLERY__MYSQL__PORT:=3306}
GALLERY__MYSQL__USERNAME=${GALLERY__MYSQL__USERNAME:=root}
GALLERY__MYSQL__DATABASE=${GALLERY__MYSQL__DATABASE:=gallery}
GALLERY__SOLR__HOSTNAME=${GALLERY__SOLR__HOSTNAME:=localhost}
GALLERY__SOLR__PORT=${GALLERY__SOLR__PORT:=8983}

docker run \
  --rm \
  --name nbgallery \
  -p 3000:3000 \
  -v `pwd`/log:/usr/src/nbgallery/log \
  -v `pwd`/data:/usr/src/nbgallery/data \
  -e GALLERY__DIRECTORIES__DATA=/usr/src/nbgallery/data \
  -e GALLERY__DIRECTORIES__CACHE=/usr/src/nbgallery/data/cache \
  -e GALLERY__DIRECTORIES__CHANGE_REQUESTS=/usr/src/nbgallery/data/change_requests \
  -e GALLERY__DIRECTORIES__STAGING=/usr/src/nbgallery/data/staging \
  -e GALLERY__MYSQL__HOST=$GALLERY__MYSQL__HOST \
  -e GALLERY__MYSQL__PORT=$GALLERY__MYSQL__PORT \
  -e GALLERY__MYSQL__USERNAME=$GALLERY__MYSQL__USERNAME \
  -e GALLERY__MYSQL__PASSWORD=$GALLERY__MYSQL__PASSWORD \
  -e GALLERY__MYSQL__DATABASE=$GALLERY__MYSQL__DATABASE \
  -e GALLERY__SOLR__HOSTNAME=$GALLERY__SOLR__HOSTNAME \
  -e GALLERY__SOLR__PORT=$GALLERY__SOLR__PORT \
  -e RAILS_SERVE_STATIC_FILES=true \
  -e SECRET_KEY_BASE=$SECRET_KEY_BASE \
  -e EMAIL_USERNAME=$EMAIL_USERNAME \
  -e EMAIL_PASSWORD=$EMAIL_PASSWORD \
  -e EMAIL_DOMAIN=$EMAIL_DOMAIN \
  -e EMAIL_ADDRESS=$EMAIL_ADDRESS \
  -e EMAIL_DEFAULT_URL_OPTIONS_HOST=$EMAIL_DEFAULT_URL_OPTIONS_HOST \
  -e EMAIL_SERVER=$EMAIL_SERVER \
  -e EMAIL_PORT=$EMAIL_PORT \
  -e GITHUB_ID=$GITHUB_ID \
  -e GITHUB_SECRET=$GITHUB_SECRET \
  -e GITLAB_ID=$GITLAB_ID \
  -e GITLAB_SECRET=$GITLAB_SECRET \
  -e GITLAB_URL=$GITLAB_URL \
  -e GOOGLE_ID=$GOOGLE_ID \
  -e GOOGLE_SECRET=$GOOGLE_SECRET \
  -e FACEBOOK_ID=$FACEBOOK_ID \
  -e FACEBOOK_SECRET=$FACEBOOK_SECRET \
  -e AZURE_ID=$AZURE_ID \
  -e AZURE_SECRET=$AZURE_SECRET \
  -e AZURE_TENANT=$AZURE_TENANT \
  -e NBGALLERY_ADMIN_USER=$NBGALLERY_ADMIN_USER \
  -e NBGALLERY_ADMIN_EMAIL=$NBGALLERY_ADMIN_EMAIL \
  -e NBGALLERY_ADMIN_PASSWORD=$NBGALLERY_ADMIN_PASSWORD \
  "$@" \
  nbgallery/nbgallery
