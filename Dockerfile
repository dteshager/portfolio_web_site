FROM ubuntu:22.04

# Install Nginx and curl
RUN apt-get update && \
    apt-get install -y nginx curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Remove default Nginx files
RUN rm -rf /var/www/html/*

# Copy your website files
COPY . /var/www/html

# Copy custom Nginx config
COPY nginx.conf /etc/nginx/sites-enabled/default

# NO LONGER NEEDED: RUN mkdir -p /etc/nginx/certs/dteshager.com/
# NO LONGER NEEDED: COPY certs/dteshager.com/...

# Expose both HTTP and HTTPS ports
EXPOSE 80
EXPOSE 443

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
