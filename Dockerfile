# Use Ubuntu as the base image
FROM ubuntu:22.04

# Install Nginx
RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Remove the default nginx static assets
RUN rm -rf /var/www/html/*

# Copy your static website files to the nginx public directory
COPY . /var/www/html

# Expose port 80
EXPOSE 80

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]