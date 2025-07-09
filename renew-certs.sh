#!/bin/bash

# Renew certificates
certbot renew

# Copy certificates to the correct locations
cp /etc/letsencrypt/live/crm.slnnzmtl.xyz/fullchain.pem /root/containers/reverse-proxy/ssl/crm.slnnzmtl.xyz/
cp /etc/letsencrypt/live/crm.slnnzmtl.xyz/privkey.pem /root/containers/reverse-proxy/ssl/crm.slnnzmtl.xyz/
cp /etc/letsencrypt/live/crm.slnnzmtl.xyz/fullchain.pem /root/containers/reverse-proxy/ssl/slnnzmtl.xyz/
cp /etc/letsencrypt/live/crm.slnnzmtl.xyz/privkey.pem /root/containers/reverse-proxy/ssl/slnnzmtl.xyz/

# Restart the reverse proxy
cd /root/containers/reverse-proxy
docker-compose restart reverse-proxy 