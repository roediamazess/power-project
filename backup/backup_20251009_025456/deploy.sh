#!/bin/bash

# PowerPro Deployment Script
# Usage: ./deploy.sh

set -e

echo "🚀 PowerPro Deployment Script"
echo "============================"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Configuration
DOMAIN="powerpro.cloud"
EMAIL="admin@powerpro.cloud"

# Function to print colored output
print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if running on server
if [ "$1" != "--force" ]; then
    print_warning "This script is designed to run on your production server."
    print_warning "Make sure you have:"
    print_warning "  - Domain DNS pointing to this server"
    print_warning "  - Docker and docker-compose installed"
    print_warning "  - Server with at least 2GB RAM"
    echo ""
    read -p "Continue? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
fi

# Step 1: Environment Setup
print_status "Step 1: Setting up environment..."
if [ ! -f .env ]; then
    cp .env.production .env
    print_status "Created .env file from production template"
else
    print_warning ".env file already exists"
fi

# Generate APP_KEY if not set
if ! grep -q "APP_KEY=.*[^[:space:]]" .env; then
    print_status "Generating Laravel APP_KEY..."
    docker-compose -f docker-compose.prod.yml run --rm app php artisan key:generate
fi

# Step 2: SSL Certificate Setup
print_status "Step 2: Setting up SSL certificates..."

# Create SSL directory
mkdir -p docker/ssl
mkdir -p docker/certbot/www

# Generate self-signed certificate for initial setup
if [ ! -f docker/ssl/$DOMAIN.crt ]; then
    print_status "Generating self-signed SSL certificate..."
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -keyout docker/ssl/$DOMAIN.key \
        -out docker/ssl/$DOMAIN.crt \
        -subj "/C=ID/ST=Jakarta/L=Jakarta/O=PowerPro/CN=$DOMAIN"
fi

# Step 3: Build and Deploy
print_status "Step 3: Building and deploying containers..."

# Stop existing containers
docker-compose -f docker-compose.prod.yml down || true

# Build and start containers
docker-compose -f docker-compose.prod.yml up -d --build

# Wait for services to be ready
print_status "Waiting for services to be ready..."
sleep 30

# Step 4: Database Setup
print_status "Step 4: Setting up database..."

# Run migrations
docker-compose -f docker-compose.prod.yml exec app php artisan migrate --force

# Seed database if needed
# docker-compose -f docker-compose.prod.yml exec app php artisan db:seed --force

# Step 5: Cache Optimization
print_status "Step 5: Optimizing Laravel caches..."

docker-compose -f docker-compose.prod.yml exec app php artisan config:cache
docker-compose -f docker-compose.prod.yml exec app php artisan route:cache
docker-compose -f docker-compose.prod.yml exec app php artisan view:cache

# Step 6: SSL Certificate (Let's Encrypt)
print_status "Step 6: Setting up Let's Encrypt SSL..."

# Request SSL certificate
docker run --rm -v $(pwd)/docker/ssl:/etc/letsencrypt -v $(pwd)/docker/certbot/www:/var/www/certbot \
    certbot/certbot certonly --webroot \
    --webroot-path=/var/www/certbot \
    --email $EMAIL \
    --agree-tos \
    --no-eff-email \
    -d $DOMAIN \
    -d www.$DOMAIN || print_warning "SSL certificate request failed. Using self-signed certificate."

# Step 7: Final Configuration
print_status "Step 7: Final configuration..."

# Set proper permissions
docker-compose -f docker-compose.prod.yml exec app chown -R www-data:www-data /var/www/storage
docker-compose -f docker-compose.prod.yml exec app chmod -R 755 /var/www/storage

# Step 8: Health Check
print_status "Step 8: Running health checks..."

# Test HTTP
if curl -s -o /dev/null -w "%{http_code}" http://localhost | grep -q "200\|301\|302"; then
    print_status "✅ HTTP health check passed"
else
    print_error "❌ HTTP health check failed"
fi

# Test HTTPS (if SSL is working)
if [ -f docker/ssl/$DOMAIN.crt ]; then
    if curl -s -k -o /dev/null -w "%{http_code}" https://$DOMAIN | grep -q "200\|301\|302"; then
        print_status "✅ HTTPS health check passed"
    else
        print_warning "⚠️  HTTPS health check failed (might be using self-signed certificate)"
    fi
fi

# Step 9: Monitoring Setup
print_status "Step 9: Setting up monitoring..."

# Install Laravel Telescope if not already installed
docker-compose -f docker-compose.prod.yml exec app php artisan telescope:install || print_warning "Telescope already installed"
docker-compose -f docker-compose.prod.yml exec app php artisan telescope:publish || print_warning "Telescope already published"

print_status "🎉 Deployment completed successfully!"
echo ""
echo "🌐 Your application is now live at:"
echo "   HTTP:  http://$DOMAIN"
echo "   HTTPS: https://$DOMAIN"
echo ""
echo "🔧 Useful commands:"
echo "   View logs: docker-compose -f docker-compose.prod.yml logs -f"
echo "   Restart:   docker-compose -f docker-compose.prod.yml restart"
echo "   Update:    docker-compose -f docker-compose.prod.yml pull && docker-compose -f docker-compose.prod.yml up -d"
echo ""
echo "📊 Monitor your application:"
echo "   Laravel Telescope: https://$DOMAIN/telescope"
echo "   Health check:      https://$DOMAIN/health"
echo ""
print_status "Deployment script completed! 🚀"