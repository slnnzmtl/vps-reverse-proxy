FROM nginx:1.25-alpine

# Copy nginx configuration file
COPY nginx.conf /etc/nginx/nginx.conf

# Create SSL directory
RUN mkdir -p /etc/nginx/ssl

# Expose ports
EXPOSE 80 443

# Start nginx
CMD ["nginx", "-g", "daemon off;"] 