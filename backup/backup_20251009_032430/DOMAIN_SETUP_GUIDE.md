# 🌐 Panduan Setup Domain dengan Docker

## 📋 Konsep Setup

Anda akan menjalankan website Laravel di server lokal dengan Docker, dan menggunakan domain Hostinger untuk mengarahkan traffic ke server lokal Anda.

### Arsitektur:
```
Internet → Domain Hostinger → Server Lokal (Docker) → Website Laravel
```

## 🚀 Langkah-langkah Setup

### 1. Persiapan Server Lokal

#### Install Docker Desktop
1. Download Docker Desktop dari [docker.com](https://www.docker.com/products/docker-desktop)
2. Install dan restart komputer
3. Pastikan Docker berjalan

#### Setup Project
```bash
# Jalankan script setup
setup-domain.bat

# Atau manual:
copy env.domain.example .env
docker-compose -f docker-compose.domain.yml up -d
```

### 2. Konfigurasi Domain di Hostinger

#### Opsi A: A-Record (Recommended)
1. Login ke Hostinger Control Panel
2. Buka **DNS Zone Editor**
3. Tambah A-Record:
   - **Name**: @ (atau kosong)
   - **Type**: A
   - **Value**: IP_PUBLIK_SERVER_ANDA
   - **TTL**: 3600

4. Tambah A-Record untuk www:
   - **Name**: www
   - **Type**: A
   - **Value**: IP_PUBLIK_SERVER_ANDA
   - **TTL**: 3600

#### Opsi B: CNAME (Jika ada subdomain)
1. Buat subdomain: `powerpro.yourdomain.com`
2. Set CNAME ke IP server Anda

### 3. Konfigurasi Router/Port Forwarding

#### Port Forwarding
Buka router admin panel dan forward port:
- **Port 80** → IP_LOKAL:80
- **Port 443** → IP_LOKAL:443

#### Cek IP Publik
```bash
# Cek IP publik server Anda
curl ifconfig.me
# atau
curl ipinfo.io/ip
```

### 4. Setup SSL Certificate

#### Generate Self-Signed Certificate (Testing)
```bash
# Di folder docker/ssl
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout powerpro.cloud.key \
    -out powerpro.cloud.crt \
    -subj "/C=ID/ST=Jakarta/L=Jakarta/O=PowerPro/CN=powerpro.cloud"
```

#### Let's Encrypt (Production)
```bash
# Request SSL certificate
docker-compose -f docker-compose.domain.yml exec nginx certbot certonly \
    --webroot \
    --webroot-path=/var/www/certbot \
    --email admin@powerpro.cloud \
    --agree-tos \
    --no-eff-email \
    -d powerpro.cloud \
    -d www.powerpro.cloud
```

### 5. Konfigurasi Dynamic DNS (Optional)

#### Menggunakan Cloudflare
1. Buat akun Cloudflare
2. Add domain powerpro.cloud
3. Dapatkan API key dan Zone ID
4. Update file `.env`:
```env
DDNS_PROVIDER=cloudflare
DDNS_EMAIL=your-email@example.com
DDNS_API_KEY=your_cloudflare_api_key
DDNS_ZONE_ID=your_cloudflare_zone_id
```

### 6. Testing

#### Test Lokal
```bash
# Test HTTP
curl http://localhost

# Test HTTPS
curl -k https://localhost
```

#### Test Domain
```bash
# Test domain
curl https://powerpro.cloud

# Test dengan browser
start https://powerpro.cloud
```

## 🔧 Troubleshooting

### Domain Tidak Bisa Diakses

#### Cek DNS Propagation
```bash
# Cek DNS
nslookup powerpro.cloud
dig powerpro.cloud

# Cek dari berbagai lokasi
# https://www.whatsmydns.net/
```

#### Cek Port Forwarding
```bash
# Test port dari luar
telnet YOUR_PUBLIC_IP 80
telnet YOUR_PUBLIC_IP 443
```

#### Cek Firewall
```bash
# Windows Firewall
netsh advfirewall firewall add rule name="HTTP" dir=in action=allow protocol=TCP localport=80
netsh advfirewall firewall add rule name="HTTPS" dir=in action=allow protocol=TCP localport=443
```

### Error SSL

#### Self-Signed Certificate
- Browser akan warning tentang certificate
- Klik "Advanced" → "Proceed to powerpro.cloud"

#### Let's Encrypt Error
- Pastikan domain sudah pointing ke server
- Cek port 80 dan 443 terbuka
- Cek file .well-known/acme-challenge/ bisa diakses

### Error Database

#### Cek Database Connection
```bash
# Test database
docker-compose -f docker-compose.domain.yml exec app php artisan tinker
# Di dalam tinker:
DB::connection()->getPdo();
```

#### Reset Database
```bash
# Reset database
docker-compose -f docker-compose.domain.yml exec app php artisan migrate:fresh --force
```

## 📊 Monitoring

### Log Files
```bash
# View logs
docker-compose -f docker-compose.domain.yml logs -f

# View specific service logs
docker-compose -f docker-compose.domain.yml logs -f nginx
docker-compose -f docker-compose.domain.yml logs -f app
```

### Health Check
```bash
# Check service status
docker-compose -f docker-compose.domain.yml ps

# Check health
curl https://powerpro.cloud/health
```

## 🔄 Update Website

### Update Code
```bash
# Pull latest code
git pull origin main

# Rebuild containers
docker-compose -f docker-compose.domain.yml up -d --build

# Run migrations
docker-compose -f docker-compose.domain.yml exec app php artisan migrate --force
```

### Update SSL
```bash
# Renew SSL certificate
docker-compose -f docker-compose.domain.yml exec nginx certbot renew
```

## 🎯 Keuntungan Setup Ini

1. **Full Control**: Anda punya kontrol penuh atas server
2. **Cost Effective**: Hanya bayar domain, server gratis
3. **Development**: Mudah untuk development dan testing
4. **Scalable**: Bisa upgrade server kapan saja
5. **Security**: Data tetap di server Anda

## 📞 Support

Jika ada masalah:
1. Cek log Docker: `docker-compose logs -f`
2. Cek DNS propagation: https://www.whatsmydns.net/
3. Cek port forwarding di router
4. Cek firewall Windows

---

**Selamat! Website PowerPro Anda akan live di https://powerpro.cloud** 🚀



