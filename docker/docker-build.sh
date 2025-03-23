#!/bin/bash
if [ ! -e .env ]; then
    echo NODE_ENV=production  >> .env
    echo TZ=Asia/Tokyo >> .env
    echo MYDNSJP_MASTERID= >> .env
    echo MYDNSJP_MASTERPWD= >> .env
    echo MYDNSJP_URL=https://www.mydns.jp/directedit.html >> .env
    echo CERTBOT_DOMAIN= >> .env
    echo CERTBOT_EMAIL= >> .env
fi
docker build . -f ./docker/Dockerfile -t Knu334/mydns-01:latest --build-arg ARCH=
