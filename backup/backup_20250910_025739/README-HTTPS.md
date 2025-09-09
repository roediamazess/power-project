# 🔒 HTTPS Setup Guide untuk powerpro.cloud

Panduan lengkap untuk mengatur HTTPS pada website Laravel Docker Anda.

## 📋 Prerequisites

### 1. Server Requirements
- Ubuntu/Debian server dengan root access
- Domain `powerpro.cloud` pointing ke server IP
- Docker & Docker Compose terinstall
- Port 80 & 443 terbuka di firewall

### 2. DNS Configuration
Pastikan DNS records sudah benar:

```bash
# A Record
Type: A
Name: @
Value: [YOUR_SERVER_IP]
TTL: 300

# CNAME Record
Type: CNAME
Name: www
Value: powerpro.cloud
TTL: 300
```

### 3. Firewall Setup
```bash
# Ubuntu/Debian
sudo ufw allow 80
sudo ufw allow 443
sudo ufw --force enable

# CentOS/RHEL
sudo firewall-cmd --permanent --add-port=80/tcp
sudo firewall-cmd --permanent --add-port=443/tcp
sudo firewall-cmd --reload
```

---

## 🚀 Quick Setup (Automated)

### Step 1: Clone & Setup
```bash
# Clone project
git clone [YOUR_REPO_URL] powerpro
cd powerpro

# Make scripts executable
chmod +x setup-https.sh
chmod +x deploy.sh
```

### Step 2: Run HTTPS Setup
```bash
# Jalankan setup HTTPS otomatis
./setup-https.sh
```

### Step 3: Verify Setup
```bash
# Test HTTPS access
curl -I https://powerpro.cloud

# Check SSL certificate
openssl s_client -connect powerpro.cloud:443 -servername powerpro.cloud | openssl x509 -noout -dates
```

---

## 🔧 Manual Setup (Step-by-Step)

### Step 1: Environment Configuration
```bash
# Copy production environment
cp .env.production .env

# Edit .env file
nano .env
```

**Update konfigurasi berikut:**
```env
APP_NAME="PowerPro"
APP_ENV=production
APP_KEY=  # Generate nanti
APP_DEBUG=false
APP_URL=https://powerpro.cloud

# Database
DB_CONNECTION=pgsql
DB_HOST=db
DB_PORT=5432
DB_DATABASE=laravel
DB_USERNAME=user
DB_PASSWORD=your_secure_password

# Redis
REDIS_HOST=redis
REDIS_PASSWORD=your_redis_password

# Email (opsional)
MAIL_MAILER=smtp
MAIL_HOST=your_smtp_host
MAIL_PORT=587
MAIL_USERNAME=your_email@powerpro.cloud
MAIL_PASSWORD=your_email_password
```

### Step 2: SSL Certificate Preparation
```bash
# Create SSL directories
mkdir -p docker/ssl
mkdir -p docker/certbot/www

# Generate self-signed certificate (temporary)
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout docker/ssl/powerpro.cloud.key \
    -out docker/ssl/powerpro.cloud.crt \
    -subj "/C=ID/ST=Jakarta/L=Jakarta/O=PowerPro/CN=powerpro.cloud"
```

### Step 3: Deploy dengan Docker
```bash
# Build & start containers
docker-compose -f docker-compose.prod.yml up -d --build

# Wait for containers
sleep 30

# Generate Laravel key
docker-compose -f docker-compose.prod.yml exec app php artisan key:generate --force

# Run migrations
docker-compose -f docker-compose.prod.yml exec app php artisan migrate --force

# Optimize caches
docker-compose -f docker-compose.prod.yml exec app php artisan config:cache
docker-compose -f docker-compose.prod.yml exec app php artisan route:cache
docker-compose -f docker-compose.prod.yml exec app php artisan view:cache
```

### Step 4: Let's Encrypt SSL Certificate
```bash
# Install Certbot
sudo apt update
sudo apt install certbot -y

# Request SSL certificate
sudo certbot certonly --webroot \
    --webroot-path=/home/ubuntu/powerpro/docker/certbot/www \
    --email admin@powerpro.cloud \
    --agree-tos \
    --no-eff-email \
    -d powerpro.cloud \
    -d www.powerpro.cloud

# Copy certificates to Docker
sudo cp /etc/letsencrypt/live/powerpro.cloud/fullchain.pem docker/ssl/powerpro.cloud.crt
sudo cp /etc/letsencrypt/live/powerpro.cloud/privkey.pem docker/ssl/powerpro.cloud.key

# Set proper permissions
sudo chown ubuntu:ubuntu docker/ssl/*
```

### Step 5: Restart dengan SSL
```bash
# Restart Nginx dengan SSL
docker-compose -f docker-compose.prod.yml restart nginx

# Verify SSL
curl -I https://powerpro.cloud
```

---

## 🔍 Troubleshooting

### Issue: Certificate Not Found
```bash
# Check certificate files
ls -la docker/ssl/

# Check Nginx logs
docker-compose -f docker-compose.prod.yml logs nginx

# Test certificate validity
openssl x509 -in docker/ssl/powerpro.cloud.crt -text -noout
```

### Issue: HTTP Not Redirecting to HTTPS
```bash
# Check Nginx configuration
docker-compose -f docker-compose.prod.yml exec nginx nginx -t

# Reload Nginx config
docker-compose -f docker-compose.prod.yml exec nginx nginx -s reload
```

### Issue: Mixed Content Warnings
```bash
# Update APP_URL in .env
echo "APP_URL=https://powerpro.cloud" >> .env

# Clear Laravel caches
docker-compose -f docker-compose.prod.yml exec app php artisan config:clear
docker-compose -f docker-compose.prod.yml exec app php artisan config:cache
```

### Issue: Domain Not Resolving
```bash
# Check DNS
nslookup powerpro.cloud
dig powerpro.cloud

# Check server IP
curl ifconfig.me
```

---

## 🔄 SSL Certificate Renewal

### Automatic Renewal (Recommended)
```bash
# Setup cron job
sudo crontab -e

# Add this line (runs daily at 2 AM)
0 2 * * * /home/ubuntu/powerpro/renew-ssl.sh
```

### Manual Renewal
```bash
# Run renewal script
./renew-ssl.sh

# Or manual renewal
sudo certbot renew

# Copy renewed certificates
sudo cp /etc/letsencrypt/live/powerpro.cloud/fullchain.pem docker/ssl/powerpro.cloud.crt
sudo cp /etc/letsencrypt/live/powerpro.cloud/privkey.pem docker/ssl/powerpro.cloud.key

# Restart Nginx
docker-compose -f docker-compose.prod.yml restart nginx
```

---

## 📊 Monitoring & Maintenance

### Health Checks
```bash
# Application health
curl https://powerpro.cloud/health

# SSL certificate expiry
openssl s_client -connect powerpro.cloud:443 -servername powerpro.cloud | openssl x509 -noout -dates

# Certificate validity days
openssl x509 -in docker/ssl/powerpro.cloud.crt -noout -checkend 86400 && echo "Certificate is valid" || echo "Certificate expired or will expire soon"
```

### Logs Monitoring
```bash
# Nginx access logs
docker-compose -f docker-compose.prod.yml logs nginx

# Laravel application logs
docker-compose -f docker-compose.prod.yml logs app

# Certificate renewal logs
tail -f /var/log/letsencrypt/letsencrypt.log
```

### Performance Monitoring
```bash
# SSL/TLS handshake time
openssl s_time -connect powerpro.cloud:443 -www / -new

# HTTP/2 support check
curl -I --http2 https://powerpro.cloud

# Security headers check
curl -I https://powerpro.cloud | grep -E "(Strict-Transport-Security|X-Frame-Options|X-Content-Type-Options)"
```

---

## 🔒 Security Best Practices

### 1. SSL/TLS Configuration
- ✅ TLS 1.2 & 1.3 only
- ✅ Strong cipher suites
- ✅ HSTS header enabled
- ✅ Certificate auto-renewal

### 2. Nginx Security
- ✅ Security headers implemented
- ✅ Rate limiting enabled
- ✅ Hidden files protection
- ✅ PHP execution restrictions

### 3. Laravel Security
- ✅ APP_DEBUG=false in production
- ✅ Secure APP_KEY generated
- ✅ CSRF protection enabled
- ✅ XSS protection active

---

## 🎯 Final Verification

### Test Checklist
- [ ] `https://powerpro.cloud` accessible
- [ ] HTTP redirects to HTTPS
- [ ] SSL certificate valid (green padlock)
- [ ] No mixed content warnings
- [ ] Laravel Telescope accessible
- [ ] Database connections working
- [ ] Email sending functional

### Performance Benchmarks
```bash
# Response time test
curl -o /dev/null -s -w "%{time_total}\n" https://powerpro.cloud

# SSL Labs test
# Visit: https://www.ssllabs.com/ssltest/analyze.html?d=powerpro.cloud

# Security headers test
# Visit: https://securityheaders.com/?q=powerpro.cloud
```

---

## 🚨 Emergency Contacts

Jika ada masalah dengan HTTPS setup:

1. **SSL Certificate Issues**: Check Let's Encrypt logs
2. **Domain Resolution**: Contact DNS provider
3. **Server Firewall**: Check UFW/firewalld rules
4. **Docker Issues**: Check container logs
5. **Laravel Issues**: Check application logs

---

## 🎉 Success!

Setelah setup selesai, website Anda akan:

✅ **Secure dengan HTTPS** 🔒  
✅ **SSL Certificate valid** 📜  
✅ **HTTP redirects to HTTPS** 🔄  
✅ **Performance optimized** ⚡  
✅ **Security headers active** 🛡️  
✅ **Auto SSL renewal** 🔄  

**Website powerpro.cloud siap untuk production!** 🚀