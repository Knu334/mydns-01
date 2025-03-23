#!/bin/bash
certbot certonly --manual \
    --preferred-challenges dns \
    -d *.${CERTBOT_DOMAIN} \
    -d ${CERTBOT_DOMAIN} \
    --email ${CERTBOT_EMAIL} \
    --agree-tos \
    --manual-auth-hook /app/docker/authenticator.sh \
    --manual-cleanup-hook /app/docker/cleanup.sh
