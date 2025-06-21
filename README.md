# Dereje's Personal Website

A modern, responsive personal website built with HTML, CSS, and JavaScript, featuring a portfolio, about section, and contact information.

## Features

- Responsive design
- Modern UI/UX
- Portfolio showcase
- About section with skills and experience
- Contact information
- HTTPS support with SSL certificates
- Docker containerization

## HTTPS Setup on EC2

### Prerequisites

1. An EC2 instance running Ubuntu 22.04
2. A domain name (dteshager.com) pointing to your EC2 instance
3. Security groups configured to allow HTTP (80) and HTTPS (443) traffic

### Quick Deployment

1. **Clone or upload your files to EC2:**
   ```bash
   # If using git
   git clone <your-repo-url>
   cd personal_web_sit_and_projects
   
   # Or upload files via SCP/SFTP
   ```

2. **Make scripts executable:**
   ```bash
   chmod +x deploy-ec2.sh
   chmod +x setup-ssl.sh
   ```

3. **Run the deployment script:**
   ```bash
   ./deploy-ec2.sh
   ```

### Manual Deployment Steps

If you prefer to deploy manually:

1. **Update system and install Docker:**
   ```bash
   sudo apt-get update && sudo apt-get upgrade -y
   curl -fsSL https://get.docker.com -o get-docker.sh
   sudo sh get-docker.sh
   sudo usermod -aG docker $USER
   sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
   sudo chmod +x /usr/local/bin/docker-compose
   ```

2. **Create directories:**
   ```bash
   mkdir -p ssl-certs logs
   ```

3. **Build and start the container:**
   ```bash
   sudo docker-compose up -d --build
   ```

4. **Set up SSL certificates:**
   ```bash
   ./setup-ssl.sh
   ```

5. **Restart the container:**
   ```bash
   sudo docker-compose restart
   ```

### SSL Certificate Management

- Certificates are automatically renewed daily at 12:00 PM
- Certificates are stored in `/etc/letsencrypt/`
- Nginx configuration uses certificates from `/etc/nginx/certs/dteshager.com/`

### Security Features

- HTTP to HTTPS redirect
- Modern SSL protocols (TLS 1.2, 1.3)
- Security headers (HSTS, X-Frame-Options, etc.)
- Gzip compression
- Static asset caching

### Troubleshooting

1. **Check container status:**
   ```bash
   sudo docker-compose ps
   sudo docker-compose logs
   ```

2. **Check nginx configuration:**
   ```bash
   sudo nginx -t
   ```

3. **Check SSL certificate status:**
   ```bash
   sudo certbot certificates
   ```

4. **Manual certificate renewal:**
   ```bash
   sudo certbot renew
   ```

### File Structure

```
personal_web_sit_and_projects/
├── index.html          # Main website file
├── style.css           # Stylesheet
├── images/             # Image assets
├── nginx.conf          # Nginx configuration
├── Dockerfile          # Docker configuration
├── docker-compose.yml  # Docker Compose configuration
├── setup-ssl.sh        # SSL setup script
├── deploy-ec2.sh       # Deployment script
└── README.md           # This file
```

## Contact

- Email: derejeteshager0@gmail.com
- LinkedIn: [Dereje Teshager](https://linkedin.com/in/dereje-teshager-734a45288)
- GitHub: [dteshager](https://github.com/dteshager)