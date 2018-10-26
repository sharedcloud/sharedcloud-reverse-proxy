#!/usr/bin/env bash

if [ -z "$ENVIRONMENT" ]; then
    echo "Please provide the 'ENVIRONMENT' env var."
    exit 1;
fi

if [ "$ENVIRONMENT" = "production" ]; then
    cp app/production/nginx.conf /etc/nginx/nginx.conf
fi
if [ "$ENVIRONMENT" = "staging" ]; then
    cp app/staging/nginx.conf /etc/nginx/nginx.conf
    cp app/staging/.htpasswd /etc/nginx/.htpasswd
fi
if [ "$ENVIRONMENT" = "development" ]; then
    cp app/development/nginx.conf /etc/nginx/nginx.conf
fi

nginx
