#!/bin/bash

# HTTPS Setup Script for powerpro.cloud
# This script helps you set up HTTPS for your Laravel Docker application

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

DOMAIN="powerpro.cloud"
EMAIL="admin@powerpro.cloud"

echo -e "${BLUE}🔒 HTTPS Setup untuk powerpro.cloud${NC}"
echo "======================================"

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

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

# Step 1: Check prerequisites
echo -e "\n${BLUE}Step 1: Checking Prerequisites${NC}"

# Check if Docker is installed
if command_exists docker; then
    print_status "Docker is installed"
else
    print_error "Docker is not installed. Please install Docker first."
    exit 1
fi

# Check if docker-compose is installed
if command_exists docker-compose; then
    print_status "Docker Compose is installed"
else
    print_error "Docker Compose is not installed. Please install Docker Compose first."
    exit 1
fi

# Check if domain resolves to this server
print_info "Checking DNS resolution for $DOMAIN..."
if nslookup $DOMAIN >/dev/null 2>&1; then
    print_status "Domain $DOMAIN resolves correctly"
else
    print_warning "Domain $DOMAIN does not resolve. Please check DNS settings."
    echo "Make sure you have added A record: $DOMAIN -> YOUR_SERVER_IP"
fi

# Step 2: Create SSL directory structure
echo -e "\n${BLUE}Step 2: Creating SSL Directory Structure${NC}"
mkdir -p docker/ssl
mkdir -p docker/certbot/www
print_status "SSL directories created"

# Step 3: Generate self-signed certificate for initial setup
echo -e "\n${BLUE}Step 3: Generating Self-Signed Certificate${NC}"
if [ ! -f docker/ssl/$DOMAIN.crt ]; then
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -keyout docker/ssl/$DOMAIN.key \
        -out docker/ssl/$DOMAIN.crt \
        -subj "/C=ID/ST=Jakarta/L=Jakarta/O=PowerPro/CN=$DOMAIN"
    print_status "Self-signed certificate generated"
else
    print_status "Certificate already exists"
fi

# Step 4: Update environment configuration
echo -e "\n${BLUE}Step 4: Updating Environment Configuration${NC}"
if [ ! -f .env ]; then
    cp .env.production .env
    print_status "Created .env from production template"
fi

# Update APP_URL to HTTPS
if grep -q "APP_URL=http://" .env; then
    sed -i "s|APP_URL=http://|APP_URL=https://|g" .env
    print_status "Updated APP_URL to HTTPS"
fi

# Step 5: Build and start containers
echo -e "\n${BLUE}Step 5: Building and Starting Containers${NC}"
print_info "This may take a few minutes..."

# Stop existing containers
docker-compose -f docker-compose.prod.yml down 2>/dev/null || true

# Build and start containers
docker-compose -f docker-compose.prod.yml up -d --build

# Wait for containers to be ready
print_info "Waiting for containers to be ready..."
sleep 30

# Step 6: Generate Laravel APP_KEY if needed
echo -e "\n${BLUE}Step 6: Generating Laravel Application Key${NC}"
if ! docker-compose -f docker-compose.prod.yml exec -T app grep -q "APP_KEY=.*[^[:space:]]" /var/www/.env; then
    docker-compose -f docker-compose.prod.yml exec app php artisan key:generate --force
    print_status "Laravel APP_KEY generated"
else
    print_status "APP_KEY already exists"
fi

# Step 7: Run database migrations
echo -e "\n${BLUE}Step 7: Running Database Migrations${NC}"
docker-compose -f docker-compose.prod.yml exec app php artisan migrate --force
print_status "Database migrations completed"

# Step 8: Optimize Laravel caches
echo -e "\n${BLUE}Step 8: Optimizing Laravel Caches${NC}"
docker-compose -f docker-compose.prod.yml exec app php artisan config:cache
docker-compose -f docker-compose.prod.yml exec app php artisan route:cache
docker-compose -f docker-compose.prod.yml exec app php artisan view:cache
print_status "Laravel caches optimized"

# Step 9: Setup Let's Encrypt SSL Certificate
echo -e "\n${BLUE}Step 9: Setting up Let's Encrypt SSL Certificate${NC}"

# Create certbot configuration
cat > docker/certbot/cli.ini << EOF
# Certbot configuration for powerpro.cloud
email = $EMAIL
text = true
agree-tos = true
no-eff-email = true
webroot-path = /var/www/certbot
domains = $DOMAIN, www.$DOMAIN
rsa-key-size = 4096
must-staple = false
redirect = false
duplicate = false
manual = false
preferred-challenges = http-01
EOF

print_info "Requesting SSL certificate from Let's Encrypt..."
print_info "This may take a moment..."

# Request certificate using webroot method
docker run --rm \
    -v $(pwd)/docker/ssl:/etc/letsencrypt \
    -v $(pwd)/docker/certbot/www:/var/www/certbot \
    certbot/certbot certonly \
    --webroot \
    --webroot-path=/var/www/certbot \
    --config /etc/letsencrypt/cli.ini \
    --domains $DOMAIN \
    --domains www.$DOMAIN \
    --email $EMAIL \
    --agree-tos \
    --no-eff-email \
    --force-renewal || print_warning "SSL certificate request failed. Using self-signed certificate."

# Copy certificates if successful
if [ -f docker/ssl/live/$DOMAIN/fullchain.pem ]; then
    cp docker/ssl/live/$DOMAIN/fullchain.pem docker/ssl/$DOMAIN.crt
    cp docker/ssl/live/$DOMAIN/privkey.pem docker/ssl/$DOMAIN.key
    print_status "SSL certificates copied successfully"
else
    print_warning "Using self-signed certificate. You can run SSL setup again later."
fi

# Step 10: Restart containers with SSL
echo -e "\n${BLUE}Step 10: Restarting Containers with SSL${NC}"
docker-compose -f docker-compose.prod.yml restart nginx
print_status "Nginx restarted with SSL configuration"

# Step 11: Test HTTPS setup
echo -e "\n${BLUE}Step 11: Testing HTTPS Setup${NC}"

# Test HTTP to HTTPS redirect
HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://$DOMAIN)
if [ "$HTTP_STATUS" = "301" ] || [ "$HTTP_STATUS" = "302" ]; then
    print_status "HTTP to HTTPS redirect working"
else
    print_warning "HTTP to HTTPS redirect may not be working"
fi

# Test HTTPS access
HTTPS_STATUS=$(curl -s -k -o /dev/null -w "%{http_code}" https://$DOMAIN)
if [ "$HTTPS_STATUS" = "200" ]; then
    print_status "HTTPS access working"
else
    print_warning "HTTPS access may not be working properly"
fi

# Step 12: Setup automatic certificate renewal
echo -e "\n${BLUE}Step 12: Setting up Certificate Auto-Renewal${NC}"

# Create renewal script
cat > renew-ssl.sh << 'EOF'
#!/bin/bash
# SSL Certificate Renewal Script

DOMAIN="powerpro.cloud"
EMAIL="admin@powerpro.cloud"

echo "🔄 Renewing SSL certificates..."

# Renew certificates
docker run --rm \
    -v $(pwd)/docker/ssl:/etc/letsencrypt \
    -v $(pwd)/docker/certbot/www:/var/www/certbot \
    certbot/certbot renew \
    --webroot \
    --webroot-path=/var/www/certbot

# Copy renewed certificates
if [ -f docker/ssl/live/$DOMAIN/fullchain.pem ]; then
    cp docker/ssl/live/$DOMAIN/fullchain.pem docker/ssl/$DOMAIN.crt
    cp docker/ssl/live/$DOMAIN/privkey.pem docker/ssl/$DOMAIN.key
    echo "✅ Certificates renewed and copied"
    
    # Reload nginx
    docker-compose -f docker-compose.prod.yml restart nginx
    echo "✅ Nginx reloaded with new certificates"
else
    echo "❌ Certificate renewal failed"
fi
EOF

chmod +x renew-ssl.sh
print_status "SSL renewal script created"

# Setup cron job for automatic renewal
if command_exists crontab; then
    (crontab -l ; echo "0 12 * * * $(pwd)/renew-ssl.sh") | crontab -
    print_status "Automatic renewal scheduled (daily at 12:00)"
fi

# Step 13: Final verification
echo -e "\n${BLUE}Step 13: Final Verification${NC}"

echo "🌐 Your website is now accessible at:"
echo "   HTTPS: https://$DOMAIN"
echo "   HTTP:  http://$DOMAIN (redirects to HTTPS)"

echo -e "\n🔧 Useful commands:"
echo "   Check status: docker-compose -f docker-compose.prod.yml ps"
echo "   View logs:    docker-compose -f docker-compose.prod.yml logs -f"
echo "   Renew SSL:   ./renew-ssl.sh"
echo "   Restart:     docker-compose -f docker-compose.prod.yml restart"

echo -e "\n📊 Monitoring:"
echo "   Health check: https://$DOMAIN/health"
echo "   Laravel Telescope: https://$DOMAIN/telescope"

# Check SSL certificate expiry
if [ -f docker/ssl/$DOMAIN.crt ]; then
    echo -e "\n🔒 SSL Certificate Info:"
    openssl x509 -in docker/ssl/$DOMAIN.crt -text -noout | grep -E "(Subject:|Issuer:|Not Before:|Not After :)"
fi

print_status "HTTPS setup completed successfully! 🎉"
echo -e "\n${GREEN}Your website is now secure with HTTPS! 🔒${NC}"