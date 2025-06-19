FROM ubuntu:22.04

# Install Nginx + Certbot (for SSL)
RUN apt-get update && \
    apt-get install -y nginx certbot python3-certbot-nginx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Remove default Nginx config
RUN rm -rf /etc/nginx/sites-enabled/default

# Copy website files
COPY . /var/www/html

# Copy Nginx config (created in Step 2)
COPY nginx.conf /etc/nginx/nginx.conf

# Copy entrypoint script (created in Step 3)
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expose HTTP/HTTPS ports
EXPOSE 80
EXPOSE 443

# Run entrypoint script on startup
ENTRYPOINT ["/entrypoint.sh"]