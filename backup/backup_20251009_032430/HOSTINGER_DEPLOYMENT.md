# 🚀 Panduan Deployment ke Hostinger

## 📋 Persiapan Sebelum Deployment

### 1. Siapkan Akun Hostinger
- Login ke [Hostinger Control Panel](https://hpanel.hostinger.com)
- Pastikan domain `powerpro.cloud` sudah aktif
- Catat informasi database dan FTP

### 2. Informasi yang Diperlukan
- **Domain**: powerpro.cloud
- **Database Host**: (dari Hostinger)
- **Database Name**: powerpro_production
- **Database User**: powerpro_user
- **Database Password**: (buat password yang kuat)
- **FTP Host**: (dari Hostinger)
- **FTP Username**: (dari Hostinger)
- **FTP Password**: (dari Hostinger)

## 🔧 Langkah-langkah Deployment

### Step 1: Siapkan File untuk Upload

```bash
# Di komputer lokal Anda
cd C:\xampp\htdocs\power-project

# Install dependencies
composer install --optimize-autoloader --no-dev

# Build assets
npm run build

# Copy file environment
cp env.production.example .env.production
```

### Step 2: Konfigurasi Environment

Edit file `.env.production` dengan informasi Hostinger Anda:

```env
APP_NAME="PowerPro"
APP_ENV=production
APP_KEY=base64:YOUR_GENERATED_KEY_HERE
APP_DEBUG=false
APP_URL=https://powerpro.cloud

DB_CONNECTION=mysql
DB_HOST=localhost
DB_PORT=3306
DB_DATABASE=powerpro_production
DB_USERNAME=powerpro_user
DB_PASSWORD=your_secure_password_here

MAIL_MAILER=smtp
MAIL_HOST=smtp.hostinger.com
MAIL_PORT=587
MAIL_USERNAME=noreply@powerpro.cloud
MAIL_PASSWORD=your_email_password_here
MAIL_ENCRYPTION=tls
MAIL_FROM_ADDRESS=noreply@powerpro.cloud
MAIL_FROM_NAME="PowerPro"
```

### Step 3: Upload ke Hostinger

#### Opsi A: Menggunakan File Manager (Recommended)
1. Login ke Hostinger Control Panel
2. Buka File Manager
3. Navigasi ke folder `public_html`
4. Upload semua file dari folder `power-project` ke `public_html`
5. **PENTING**: Pindahkan isi folder `public` ke root `public_html`

#### Opsi B: Menggunakan FTP
```bash
# Upload semua file ke public_html
# Pastikan struktur folder seperti ini:
# public_html/
#   ├── app/
#   ├── bootstrap/
#   ├── config/
#   ├── database/
#   ├── resources/
#   ├── routes/
#   ├── storage/
#   ├── vendor/
#   ├── .env
#   ├── artisan
#   ├── composer.json
#   └── index.php (dari folder public)
```

### Step 4: Konfigurasi Database

1. Buka Hostinger Control Panel
2. Buka MySQL Databases
3. Buat database baru: `powerpro_production`
4. Buat user baru: `powerpro_user`
5. Berikan semua privilege ke user untuk database tersebut
6. Catat informasi database

### Step 5: Konfigurasi Web Server

#### File .htaccess di Root (public_html/.htaccess)
```apache
<IfModule mod_rewrite.c>
    <IfModule mod_negotiation.c>
        Options -MultiViews -Indexes
    </IfModule>

    RewriteEngine On

    # Handle Authorization Header
    RewriteCond %{HTTP:Authorization} .
    RewriteRule .* - [E=HTTP_AUTHORIZATION:%{HTTP:Authorization}]

    # Redirect Trailing Slashes If Not A Folder...
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteCond %{REQUEST_URI} (.+)/$
    RewriteRule ^ %1 [L,R=301]

    # Send Requests To Front Controller...
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteRule ^ index.php [L]
</IfModule>

# Security Headers
<IfModule mod_headers.c>
    Header always set X-Content-Type-Options nosniff
    Header always set X-Frame-Options DENY
    Header always set X-XSS-Protection "1; mode=block"
    Header always set Strict-Transport-Security "max-age=31536000; includeSubDomains"
    Header always set Referrer-Policy "strict-origin-when-cross-origin"
</IfModule>

# Gzip Compression
<IfModule mod_deflate.c>
    AddOutputFilterByType DEFLATE text/plain
    AddOutputFilterByType DEFLATE text/html
    AddOutputFilterByType DEFLATE text/xml
    AddOutputFilterByType DEFLATE text/css
    AddOutputFilterByType DEFLATE application/xml
    AddOutputFilterByType DEFLATE application/xhtml+xml
    AddOutputFilterByType DEFLATE application/rss+xml
    AddOutputFilterByType DEFLATE application/javascript
    AddOutputFilterByType DEFLATE application/x-javascript
</IfModule>

# Cache Control
<IfModule mod_expires.c>
    ExpiresActive on
    ExpiresByType text/css "access plus 1 year"
    ExpiresByType application/javascript "access plus 1 year"
    ExpiresByType image/png "access plus 1 year"
    ExpiresByType image/jpg "access plus 1 year"
    ExpiresByType image/jpeg "access plus 1 year"
    ExpiresByType image/gif "access plus 1 year"
    ExpiresByType image/svg+xml "access plus 1 year"
</IfModule>
```

### Step 6: Set Permissions

Set permission folder storage dan bootstrap/cache:

```bash
# Di Hostinger File Manager atau via SSH
chmod -R 755 storage
chmod -R 755 bootstrap/cache
chown -R www-data:www-data storage
chown -R www-data:www-data bootstrap/cache
```

### Step 7: Generate Application Key

```bash
# Via SSH atau Terminal di Hostinger
php artisan key:generate
```

### Step 8: Run Migrations

```bash
# Via SSH atau Terminal di Hostinger
php artisan migrate --force
```

### Step 9: Optimize Application

```bash
# Via SSH atau Terminal di Hostinger
php artisan config:cache
php artisan route:cache
php artisan view:cache
```

## 🔒 Konfigurasi SSL

### Menggunakan SSL Gratis Hostinger
1. Buka Hostinger Control Panel
2. Buka SSL/TLS
3. Aktifkan SSL untuk domain powerpro.cloud
4. Pilih "Let's Encrypt" (gratis)

## 📧 Konfigurasi Email

### Menggunakan Email Hostinger
1. Buka Email Accounts di Hostinger
2. Buat email: noreply@powerpro.cloud
3. Gunakan konfigurasi SMTP Hostinger:
   - Host: smtp.hostinger.com
   - Port: 587
   - Encryption: TLS

## 🚀 Testing

### Test Website
1. Buka https://powerpro.cloud
2. Pastikan website load dengan benar
3. Test semua fitur utama

### Test Database
```bash
php artisan tinker
# Di dalam tinker:
DB::connection()->getPdo();
```

## 🔧 Troubleshooting

### Error 500
- Cek file .env sudah benar
- Cek permission folder storage
- Cek log di storage/logs/laravel.log

### Error Database Connection
- Cek konfigurasi database di .env
- Pastikan database dan user sudah dibuat
- Cek koneksi dari Hostinger

### Error Assets Tidak Load
- Pastikan folder public sudah di root
- Cek permission folder assets
- Jalankan `php artisan storage:link`

## 📱 Monitoring

### Laravel Telescope
- Akses: https://powerpro.cloud/telescope
- Untuk monitoring aplikasi

### Log Files
- Lokasi: storage/logs/laravel.log
- Monitor error dan performance

## 🔄 Update Website

### Cara Update
1. Upload file baru ke Hostinger
2. Jalankan: `php artisan migrate`
3. Jalankan: `php artisan config:cache`
4. Clear cache browser

## 📞 Support

Jika ada masalah:
1. Cek log error di storage/logs/
2. Cek konfigurasi .env
3. Pastikan semua file ter-upload dengan benar
4. Hubungi support Hostinger jika perlu

---

**Selamat! Website PowerPro Anda sudah live di https://powerpro.cloud** 🎉



