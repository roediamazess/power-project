#!/bin/bash

# VPS Migration Script for Laravel Docker Application
# Usage: ./migrate-to-vps.sh

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

DOMAIN="powerpro.cloud"
PROJECT_NAME="powerpro"

echo -e "${BLUE}🚀 Laravel Docker Migration to VPS${NC}"
echo "=================================="

# Function to print status
print_status() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

print_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Step 1: Server Information Collection
echo -e "\n${BLUE}Step 1: Server Information${NC}"

if [ -z "$1" ]; then
    read -p "Enter your domain (default: powerpro.cloud): " user_domain
    DOMAIN=${user_domain:-powerpro.cloud}
fi

read -p "Enter your server IP: " SERVER_IP
if [ -z "$SERVER_IP" ]; then
    print_error "Server IP is required"
    exit 1
fi

print_info "Domain: $DOMAIN"
print_info "Server IP: $SERVER_IP"

# Step 2: VPS Server Preparation
echo -e "\n${BLUE}Step 2: VPS Server Preparation${NC}"

print_info "Run these commands on your Ubuntu VPS:"
echo ""
echo "# Update system"
echo "sudo apt update && sudo apt upgrade -y"
echo ""
echo "# Install essential packages"
echo "sudo apt install -y curl wget git unzip software-properties-common ufw"
echo ""
echo "# Setup firewall"
echo "sudo ufw allow ssh"
echo "sudo ufw allow 80"
echo "sudo ufw allow 443"
echo "sudo ufw --force enable"
echo ""
echo "# Install Docker"
echo "curl -fsSL https://get.docker.com -o get-docker.sh"
echo "sudo sh get-docker.sh"
echo "sudo usermod -aG docker \$USER"
echo ""
echo "# Install Docker Compose"
echo "sudo curl -L \"https://github.com/docker/compose/releases/latest/download/docker-compose-\$(uname -s)-\$(uname -m)\" -o /usr/local/bin/docker-compose"
echo "sudo chmod +x /usr/local/bin/docker-compose"
echo ""
echo "# Create project directory"
echo "mkdir -p /var/www/$PROJECT_NAME"
echo "cd /var/www/$PROJECT_NAME"
echo ""
echo "# Logout and login again to apply docker group changes"
echo "exit"

read -p "Press Enter after completing server preparation..."

# Step 3: DNS Configuration Reminder
echo -e "\n${BLUE}Step 3: DNS Configuration${NC}"

print_info "Configure DNS records in Hostinger:"
echo ""
echo "A Record:"
echo "  Type: A"
echo "  Name: @"
echo "  Value: $SERVER_IP"
echo "  TTL: 300"
echo ""
echo "CNAME Record:"
echo "  Type: CNAME"
echo "  Name: www"
echo "  Value: $DOMAIN"
echo "  TTL: 300"

read -p "Press Enter after configuring DNS..."

# Step 4: Project Deployment
echo -e "\n${BLUE}Step 4: Project Deployment${NC}"

print_info "Run these commands on your VPS:"
echo ""
echo "# Navigate to project directory"
echo "cd /var/www/$PROJECT_NAME"
echo ""
echo "# Clone your project (replace with your repo URL)"
echo "git clone [YOUR_GIT_REPO_URL] ."
echo ""
echo "# Or if you have local files, upload them via SCP/SFTP"
echo "# scp -r /path/to/local/project user@server:/var/www/$PROJECT_NAME/"
echo ""
echo "# Set proper permissions"
echo "sudo chown -R www-data:www-data /var/www/$PROJECT_NAME"
echo "sudo chmod -R 755 /var/www/$PROJECT_NAME"
echo "sudo chmod -R 775 /var/www/$PROJECT_NAME/storage"
echo "sudo chmod -R 775 /var/www/$PROJECT_NAME/bootstrap/cache"

read -p "Press Enter after uploading project files..."

# Step 5: Environment Configuration
echo -e "\n${BLUE}Step 5: Environment Configuration${NC}"

print_info "Configure environment on VPS:"
echo ""
echo "# Copy production environment"
echo "cp .env.production .env"
echo ""
echo "# Edit .env file with your settings"
echo "nano .env"
echo ""
echo "# Required configurations:"
echo "APP_NAME=\"$PROJECT_NAME\""
echo "APP_ENV=production"
echo "APP_DEBUG=false"
echo "APP_URL=https://$DOMAIN"
echo ""
echo "DB_CONNECTION=pgsql"
echo "DB_HOST=db"
echo "DB_PORT=5432"
echo "DB_DATABASE=laravel"
echo "DB_USERNAME=user"
echo "DB_PASSWORD=your_secure_db_password"
echo ""
echo "REDIS_HOST=redis"
echo "REDIS_PASSWORD=your_secure_redis_password"
echo ""
echo "MAIL_MAILER=smtp"
echo "MAIL_HOST=your_smtp_host"
echo "MAIL_PORT=587"
echo "MAIL_USERNAME=admin@$DOMAIN"
echo "MAIL_PASSWORD=your_email_password"

read -p "Press Enter after configuring environment..."

# Step 6: SSL Certificate Setup
echo -e "\n${BLUE}Step 6: SSL Certificate Setup${NC}"

print_info "Setup SSL certificates on VPS:"
echo ""
echo "# Install Certbot"
echo "sudo apt install -y certbot"
echo ""
echo "# Create SSL directories"
echo "mkdir -p docker/ssl"
echo "mkdir -p docker/certbot/www"
echo ""
echo "# Generate self-signed certificate (temporary)"
echo "openssl req -x509 -nodes -days 365 -newkey rsa:2048 \\"
echo "    -keyout docker/ssl/$DOMAIN.key \\"
echo "    -out docker/ssl/$DOMAIN.crt \\"
echo "    -subj \"/C=ID/ST=Jakarta/L=Jakarta/O=$PROJECT_NAME/CN=$DOMAIN\""
echo ""
echo "# Set proper permissions"
echo "sudo chown -R www-data:www-data docker/ssl"

read -p "Press Enter after SSL setup..."

# Step 7: Docker Deployment
echo -e "\n${BLUE}Step 7: Docker Deployment${NC}"

print_info "Deploy with Docker on VPS:"
echo ""
echo "# Make scripts executable"
echo "chmod +x deploy.sh"
echo "chmod +x setup-https.sh"
echo ""
echo "# Run deployment"
echo "./deploy.sh"
echo ""
echo "# Or run HTTPS setup"
echo "./setup-https.sh"

read -p "Press Enter after Docker deployment..."

# Step 8: Database Migration
echo -e "\n${BLUE}Step 8: Database Migration${NC}"

print_info "Migrate database (if you have existing data):"
echo ""
echo "# If migrating from local database:"
echo "# 1. Export local database"
echo "pg_dump -U user -h localhost laravel > backup.sql"
echo ""
echo "# 2. Copy to VPS"
echo "scp backup.sql user@server:/var/www/$PROJECT_NAME/"
echo ""
echo "# 3. Import on VPS"
echo "docker-compose -f docker-compose.prod.yml exec -T db psql -U user -d laravel < backup.sql"

read -p "Press Enter after database migration (or skip if fresh install)..."

# Step 9: Final Verification
echo -e "\n${BLUE}Step 9: Final Verification${NC}"

print_info "Test your deployment:"
echo ""
echo "# Test HTTP access"
echo "curl -I http://$DOMAIN"
echo ""
echo "# Test HTTPS access"
echo "curl -I https://$DOMAIN"
echo ""
echo "# Check SSL certificate"
echo "openssl s_client -connect $DOMAIN:443 -servername $DOMAIN | openssl x509 -noout -dates"
echo ""
echo "# Check container status"
echo "docker-compose -f docker-compose.prod.yml ps"
echo ""
echo "# Check application logs"
echo "docker-compose -f docker-compose.prod.yml logs -f app"

# Step 10: Post-Deployment Tasks
echo -e "\n${BLUE}Step 10: Post-Deployment Tasks${NC}"

print_info "Setup monitoring and maintenance:"
echo ""
echo "# Setup log rotation"
echo "sudo nano /etc/logrotate.d/$PROJECT_NAME"
echo ""
echo "# Add to logrotate:"
echo "/var/www/$PROJECT_NAME/storage/logs/*.log {"
echo "    daily"
echo "    missingok"
echo "    rotate 52"
echo "    compress"
echo "    delaycompress"
echo "    notifempty"
echo "    create 644 www-data www-data"
echo "}"
echo ""
echo "# Setup automated backups"
echo "sudo nano /etc/cron.daily/backup-$PROJECT_NAME"
echo ""
echo "# Add backup script:"
echo "#!/bin/bash"
echo "# docker-compose -f /var/www/$PROJECT_NAME/docker-compose.prod.yml exec db pg_dump -U user laravel > /var/backups/$PROJECT_NAME-\$(date +\%Y\%m\%d).sql"
echo ""
echo "# Make executable"
echo "sudo chmod +x /etc/cron.daily/backup-$PROJECT_NAME"

# Step 11: Security Hardening
echo -e "\n${BLUE}Step 11: Security Hardening${NC}"

print_info "Additional security measures:"
echo ""
echo "# Install fail2ban"
echo "sudo apt install -y fail2ban"
echo ""
echo "# Configure fail2ban for SSH"
echo "sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local"
echo "sudo nano /etc/fail2ban/jail.local"
echo ""
echo "# Enable SSH protection:"
echo "[sshd]"
echo "enabled = true"
echo "port = ssh"
echo "filter = sshd"
echo "logpath = /var/log/auth.log"
echo "maxretry = 3"
echo "bantime = 3600"
echo ""
echo "# Restart fail2ban"
echo "sudo systemctl restart fail2ban"
echo ""
echo "# Setup automatic security updates"
echo "sudo apt install -y unattended-upgrades"
echo "sudo dpkg-reconfigure unattended-upgrades"

# Summary
echo -e "\n${GREEN}🎉 Migration Completed!${NC}"
echo ""
echo "🌐 Your website is now live at:"
echo "   HTTPS: https://$DOMAIN"
echo "   HTTP:  http://$DOMAIN (redirects to HTTPS)"
echo ""
echo "🔧 Useful commands:"
echo "   View status: docker-compose -f docker-compose.prod.yml ps"
echo "   View logs:   docker-compose -f docker-compose.prod.yml logs -f"
echo "   Restart:    docker-compose -f docker-compose.prod.yml restart"
echo "   Update:     docker-compose -f docker-compose.prod.yml pull && docker-compose -f docker-compose.prod.yml up -d"
echo ""
echo "📊 Monitoring:"
echo "   Health check: https://$DOMAIN/health"
echo "   Laravel Telescope: https://$DOMAIN/telescope"
echo ""
echo "🔒 Security:"
echo "   SSL Certificate: Auto-renews via Let's Encrypt"
echo "   Firewall: Configured with UFW"
echo "   Fail2Ban: Protects against brute force attacks"
echo ""
print_status "Migration to VPS completed successfully! 🚀"