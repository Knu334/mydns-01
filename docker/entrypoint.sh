#!/bin/bash
if [ -d /etc/letsencrypt/live/${CERTBOT_DOMAIN} ]; then
    certbot renew
else
    certbot certonly --manual \
        --preferred-challenges dns \
        -d *.${CERTBOT_DOMAIN} \
        -d ${CERTBOT_DOMAIN} \
        --email ${CERTBOT_EMAIL} \
        --agree-tos \
        --manual-auth-hook /app/docker/authenticator.sh \
        --manual-cleanup-hook /app/docker/cleanup.sh
fi
