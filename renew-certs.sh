#!/bin/bash

# Renew certificates using docker
docker run --rm -v /root/containers/reverse-proxy/certbot/conf:/etc/letsencrypt -v /root/containers/reverse-proxy/certbot/www:/var/www/certbot certbot/certbot renew

# Copy certificates to the correct locations (all domains use the same certificate from slnnzmtl.xyz)
cp /root/containers/reverse-proxy/certbot/conf/live/slnnzmtl.xyz/fullchain.pem /root/containers/reverse-proxy/ssl/crm.slnnzmtl.xyz/
cp /root/containers/reverse-proxy/certbot/conf/live/slnnzmtl.xyz/privkey.pem /root/containers/reverse-proxy/ssl/crm.slnnzmtl.xyz/
cp /root/containers/reverse-proxy/certbot/conf/live/slnnzmtl.xyz/fullchain.pem /root/containers/reverse-proxy/ssl/slnnzmtl.xyz/
cp /root/containers/reverse-proxy/certbot/conf/live/slnnzmtl.xyz/privkey.pem /root/containers/reverse-proxy/ssl/slnnzmtl.xyz/
cp /root/containers/reverse-proxy/certbot/conf/live/slnnzmtl.xyz/fullchain.pem /root/containers/reverse-proxy/ssl/n8n.slnnzmtl.xyz/
cp /root/containers/reverse-proxy/certbot/conf/live/slnnzmtl.xyz/privkey.pem /root/containers/reverse-proxy/ssl/n8n.slnnzmtl.xyz/
cp /root/containers/reverse-proxy/certbot/conf/live/slnnzmtl.xyz/fullchain.pem /root/containers/reverse-proxy/ssl/dev.slnnzmtl.xyz/
cp /root/containers/reverse-proxy/certbot/conf/live/slnnzmtl.xyz/privkey.pem /root/containers/reverse-proxy/ssl/dev.slnnzmtl.xyz/
cp /root/containers/reverse-proxy/certbot/conf/live/slnnzmtl.xyz/fullchain.pem /root/containers/reverse-proxy/ssl/kazansky.dev/
cp /root/containers/reverse-proxy/certbot/conf/live/slnnzmtl.xyz/privkey.pem /root/containers/reverse-proxy/ssl/kazansky.dev/
# Restart the reverse proxy
cd /root/containers/reverse-proxy
docker-compose restart reverse-proxy 