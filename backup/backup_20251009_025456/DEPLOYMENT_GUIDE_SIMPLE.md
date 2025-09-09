# 🚀 Panduan Sederhana Deploy ke Hostinger

## 📋 Yang Sudah Disiapkan

✅ **File yang sudah dibuat:**
- `env.production.example` - Template konfigurasi production
- `HOSTINGER_DEPLOYMENT.md` - Panduan lengkap
- `htaccess-hostinger.txt` - Konfigurasi .htaccess untuk Hostinger
- `prepare-hostinger.bat` - Script persiapan (jika ada Composer/NPM)

## 🎯 Langkah-langkah Deployment

### 1. Siapkan Database di Hostinger
1. Login ke [Hostinger Control Panel](https://hpanel.hostinger.com)
2. Buka **MySQL Databases**
3. Buat database baru: `powerpro_production`
4. Buat user baru: `powerpro_user`
5. Berikan semua privilege ke user untuk database
6. **Catat informasi database:**
   - Host: localhost
   - Database: powerpro_production
   - Username: powerpro_user
   - Password: (yang Anda buat)

### 2. Upload File ke Hostinger

#### Cara Upload:
1. **Buka File Manager** di Hostinger Control Panel
2. **Navigasi ke folder `public_html`**
3. **Upload semua file** dari folder `power-project` ke `public_html`
4. **PENTING**: Pindahkan isi folder `public` ke root `public_html`

#### Struktur yang benar di Hostinger:
```
public_html/
├── app/
├── bootstrap/
├── config/
├── database/
├── resources/
├── routes/
├── storage/
├── vendor/
├── .env
├── artisan
├── composer.json
├── index.php (dari folder public)
├── assets/ (dari folder public)
└── favicon.ico (dari folder public)
```

### 3. Konfigurasi Environment

1. **Rename file** `.env.production` menjadi `.env`
2. **Edit file `.env`** dengan informasi Hostinger:

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
DB_PASSWORD=your_database_password_here

MAIL_MAILER=smtp
MAIL_HOST=smtp.hostinger.com
MAIL_PORT=587
MAIL_USERNAME=noreply@powerpro.cloud
MAIL_PASSWORD=your_email_password_here
MAIL_ENCRYPTION=tls
MAIL_FROM_ADDRESS=noreply@powerpro.cloud
MAIL_FROM_NAME="PowerPro"
```

### 4. Setup .htaccess

1. **Copy isi file** `htaccess-hostinger.txt`
2. **Buat file baru** `.htaccess` di root `public_html`
3. **Paste isi** dari `htaccess-hostinger.txt`

### 5. Generate Application Key

1. **Buka Terminal/SSH** di Hostinger (jika tersedia)
2. **Jalankan perintah:**
   ```bash
   php artisan key:generate
   ```

   **Atau** edit file `.env` dan ganti `APP_KEY=` dengan key yang sudah ada di lokal:
   ```bash
   # Di komputer lokal, jalankan:
   C:\xampp\php\php.exe artisan key:generate --show
   ```

### 6. Setup Database

1. **Jalankan migrasi:**
   ```bash
   php artisan migrate --force
   ```

2. **Optimize cache:**
   ```bash
   php artisan config:cache
   php artisan route:cache
   php artisan view:cache
   ```

### 7. Set Permissions

1. **Set permission** folder storage:
   ```bash
   chmod -R 755 storage
   chmod -R 755 bootstrap/cache
   ```

### 8. Aktifkan SSL

1. **Buka SSL/TLS** di Hostinger Control Panel
2. **Aktifkan SSL** untuk domain powerpro.cloud
3. **Pilih "Let's Encrypt"** (gratis)

## 🔧 Troubleshooting

### Error 500
- ✅ Cek file `.env` sudah benar
- ✅ Cek permission folder `storage`
- ✅ Cek file `.htaccess` sudah ada

### Error Database
- ✅ Cek konfigurasi database di `.env`
- ✅ Pastikan database dan user sudah dibuat
- ✅ Test koneksi database

### Assets Tidak Load
- ✅ Pastikan folder `public` sudah di root
- ✅ Cek permission folder `assets`
- ✅ Jalankan `php artisan storage:link`

## 🎉 Selesai!

Website Anda akan bisa diakses di:
- **HTTP**: http://powerpro.cloud
- **HTTPS**: https://powerpro.cloud

## 📞 Bantuan

Jika ada masalah:
1. Cek log error di `storage/logs/laravel.log`
2. Pastikan semua file ter-upload dengan benar
3. Hubungi support Hostinger jika perlu

---

**Selamat! Website PowerPro Anda sudah live!** 🚀



