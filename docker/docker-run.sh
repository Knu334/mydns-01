#!/bin/bash
docker run --init --rm --name mydns-01 \
    --env-file .env \
    --mount type=bind,src=/etc/letsencrypt,dst=/etc/letsencrypt \
    --mount type=bind,src=/var/log/letsencrypt,dst=/var/log/letsencrypt \
    Knu334/mydns-01:latest
