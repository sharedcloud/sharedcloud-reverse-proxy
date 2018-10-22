#!/usr/bin/env bash

if [ "$ENVIRONMENT" = "production" ]; then
    cp production/nginx.conf /etc/nginx/nginx.conf
fi
if [ "$ENVIRONMENT" = "staging" ]; then
    cp staging/nginx.conf /etc/nginx/nginx.conf
    cp staging/.htpasswd /etc/nginx/.htpasswd
fi
if [ "$ENVIRONMENT" = "development" ]; then
    cp development/nginx.conf /etc/nginx/nginx.conf
fi

if [ -z "$ENVIRONMENT" ]; then
    echo "Please provide the 'ENVIRONMENT' env var."
else
    nginx
fi
