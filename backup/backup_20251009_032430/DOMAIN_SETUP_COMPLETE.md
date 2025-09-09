# 🌐 Setup Domain dengan Docker - Panduan Lengkap

## 📋 Status Setup

✅ **File yang sudah disiapkan:**
- `docker-compose.simple.yml` - Konfigurasi Docker sederhana
- `docker/nginx/conf.d/default.conf` - Konfigurasi Nginx
- `env.domain.example` - Template environment
- `DOMAIN_SETUP_GUIDE.md` - Panduan lengkap

## 🚀 Langkah-langkah Setup

### 1. Pastikan Docker Desktop Berjalan

1. **Buka Docker Desktop** di Windows
2. **Tunggu sampai status "Running"** (ikon hijau)
3. **Test Docker:**
   ```bash
   docker --version
   docker-compose --version
   ```

### 2. Jalankan Website dengan Docker

```bash
# Start services
docker-compose -f docker-compose.simple.yml up -d

# Cek status
docker-compose -f docker-compose.simple.yml ps

# View logs
docker-compose -f docker-compose.simple.yml logs -f
```

### 3. Test Akses Lokal

```bash
# Test HTTP
curl http://localhost
# atau buka browser: http://localhost
```

### 4. Konfigurasi Domain di Hostinger

#### A. Login ke Hostinger Control Panel
1. Buka [hpanel.hostinger.com](https://hpanel.hostinger.com)
2. Login dengan akun Anda

#### B. Setup DNS
1. **Buka DNS Zone Editor**
2. **Tambah A-Record:**
   - **Name**: @ (atau kosong)
   - **Type**: A
   - **Value**: `110.136.60.252` (IP publik Anda)
   - **TTL**: 3600

3. **Tambah A-Record untuk www:**
   - **Name**: www
   - **Type**: A
   - **Value**: `110.136.60.252`
   - **TTL**: 3600

### 5. Setup Port Forwarding di Router

#### A. Buka Router Admin Panel
1. Buka browser dan ketik: `192.168.1.1` atau `192.168.0.1`
2. Login dengan username/password router

#### B. Setup Port Forwarding
1. **Buka menu "Port Forwarding" atau "Virtual Server"**
2. **Tambah rule:**
   - **Service Name**: PowerPro HTTP
   - **External Port**: 80
   - **Internal IP**: IP komputer Anda (biasanya 192.168.x.x)
   - **Internal Port**: 80
   - **Protocol**: TCP

3. **Tambah rule untuk HTTPS (opsional):**
   - **Service Name**: PowerPro HTTPS
   - **External Port**: 443
   - **Internal IP**: IP komputer Anda
   - **Internal Port**: 443
   - **Protocol**: TCP

### 6. Cek IP Komputer Lokal

```bash
# Cek IP lokal
ipconfig

# Cari "IPv4 Address" di bagian adapter yang aktif
# Contoh: 192.168.1.100
```

### 7. Test Domain

#### A. Cek DNS Propagation
1. Buka [whatsmydns.net](https://www.whatsmydns.net/)
2. Masukkan domain: `powerpro.cloud`
3. Pilih record type: `A`
4. Tunggu sampai semua server menunjukkan IP `110.136.60.252`

#### B. Test Akses Domain
```bash
# Test dari komputer lain atau mobile
# Buka browser dan ketik: http://powerpro.cloud
```

## 🔧 Troubleshooting

### Domain Tidak Bisa Diakses

#### 1. Cek DNS Propagation
- Gunakan [whatsmydns.net](https://www.whatsmydns.net/)
- Tunggu 5-15 menit untuk DNS update

#### 2. Cek Port Forwarding
```bash
# Test port dari luar (gunakan online port checker)
# https://www.yougetsignal.com/tools/open-ports/
# Test port 80
```

#### 3. Cek Firewall Windows
```bash
# Buka Windows Defender Firewall
# Allow app through firewall
# Tambahkan port 80 dan 443
```

#### 4. Cek Docker Status
```bash
# Cek container running
docker ps

# Restart jika perlu
docker-compose -f docker-compose.simple.yml restart
```

### Error Database

#### 1. Reset Database
```bash
# Stop services
docker-compose -f docker-compose.simple.yml down

# Remove volumes
docker volume rm power-project_db-data

# Start services
docker-compose -f docker-compose.simple.yml up -d

# Run migrations
docker-compose -f docker-compose.simple.yml exec app php artisan migrate --force
```

### Error Nginx

#### 1. Cek Log Nginx
```bash
docker-compose -f docker-compose.simple.yml logs nginx
```

#### 2. Restart Nginx
```bash
docker-compose -f docker-compose.simple.yml restart nginx
```

## 📊 Monitoring

### Cek Status Services
```bash
# Status semua container
docker-compose -f docker-compose.simple.yml ps

# Log real-time
docker-compose -f docker-compose.simple.yml logs -f

# Log specific service
docker-compose -f docker-compose.simple.yml logs -f nginx
docker-compose -f docker-compose.simple.yml logs -f app
```

### Health Check
```bash
# Test local
curl http://localhost/health

# Test domain (setelah DNS update)
curl http://powerpro.cloud/health
```

## 🔄 Update Website

### Update Code
```bash
# Pull latest code
git pull origin main

# Rebuild containers
docker-compose -f docker-compose.simple.yml up -d --build

# Run migrations
docker-compose -f docker-compose.simple.yml exec app php artisan migrate --force
```

### Backup Database
```bash
# Backup database
docker-compose -f docker-compose.simple.yml exec db pg_dump -U powerpro_user powerpro_production > backup.sql
```

## 🎯 Keuntungan Setup Ini

1. **Full Control**: Kontrol penuh atas server dan data
2. **Cost Effective**: Hanya bayar domain, server gratis
3. **Development**: Mudah untuk development dan testing
4. **Scalable**: Bisa upgrade server kapan saja
5. **Security**: Data tetap di server Anda

## 📞 Support

Jika ada masalah:
1. Cek log Docker: `docker-compose logs -f`
2. Cek DNS propagation: [whatsmydns.net](https://www.whatsmydns.net/)
3. Cek port forwarding di router
4. Cek firewall Windows

---

## 🎉 Hasil Akhir

Setelah setup selesai, website Anda akan bisa diakses di:
- **Lokal**: http://localhost
- **Domain**: http://powerpro.cloud
- **IP Publik**: http://110.136.60.252

**Selamat! Website PowerPro Anda sudah live dengan domain sendiri!** 🚀



