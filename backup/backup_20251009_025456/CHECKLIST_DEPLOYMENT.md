# ✅ Checklist Deployment ke Hostinger

## 📁 File yang Sudah Siap

### File Utama Laravel
- ✅ `app/` - Folder aplikasi
- ✅ `bootstrap/` - Bootstrap Laravel
- ✅ `config/` - Konfigurasi aplikasi
- ✅ `database/` - Migrasi dan seeder
- ✅ `resources/` - Views dan assets
- ✅ `routes/` - Routing aplikasi
- ✅ `storage/` - Storage Laravel
- ✅ `vendor/` - Dependencies Composer
- ✅ `artisan` - Command line tool
- ✅ `composer.json` - Dependencies
- ✅ `composer.lock` - Lock file

### File Konfigurasi
- ✅ `env.production.example` - Template environment production
- ✅ `htaccess-hostinger.txt` - Konfigurasi .htaccess untuk Hostinger
- ✅ `HOSTINGER_DEPLOYMENT.md` - Panduan lengkap deployment
- ✅ `DEPLOYMENT_GUIDE_SIMPLE.md` - Panduan sederhana

### File dari Public Folder
- ✅ `public/index.php` - Entry point Laravel
- ✅ `public/assets/` - CSS, JS, images
- ✅ `public/favicon.ico` - Favicon

## 🚀 Langkah Deployment

### 1. Database Setup di Hostinger
- [ ] Login ke Hostinger Control Panel
- [ ] Buka MySQL Databases
- [ ] Buat database: `powerpro_production`
- [ ] Buat user: `powerpro_user`
- [ ] Berikan privilege ke user
- [ ] Catat informasi database

### 2. Upload File
- [ ] Buka File Manager di Hostinger
- [ ] Upload semua file ke `public_html`
- [ ] Pindahkan isi folder `public` ke root `public_html`
- [ ] Hapus folder `public` yang kosong

### 3. Konfigurasi Environment
- [ ] Rename `.env.production` menjadi `.env`
- [ ] Edit `.env` dengan informasi database Hostinger
- [ ] Set `APP_URL=https://powerpro.cloud`
- [ ] Set `APP_DEBUG=false`

### 4. Setup .htaccess
- [ ] Copy isi `htaccess-hostinger.txt`
- [ ] Buat file `.htaccess` di root `public_html`
- [ ] Paste konfigurasi .htaccess

### 5. Generate Application Key
- [ ] Jalankan `php artisan key:generate` di Hostinger
- [ ] Atau copy key dari lokal ke `.env`

### 6. Database Migration
- [ ] Jalankan `php artisan migrate --force`
- [ ] Jalankan `php artisan config:cache`
- [ ] Jalankan `php artisan route:cache`
- [ ] Jalankan `php artisan view:cache`

### 7. Set Permissions
- [ ] Set permission folder `storage` (755)
- [ ] Set permission folder `bootstrap/cache` (755)

### 8. SSL Setup
- [ ] Buka SSL/TLS di Hostinger
- [ ] Aktifkan SSL untuk powerpro.cloud
- [ ] Pilih Let's Encrypt (gratis)

### 9. Testing
- [ ] Test akses http://powerpro.cloud
- [ ] Test akses https://powerpro.cloud
- [ ] Test semua fitur website
- [ ] Test database connection

## 🔧 Troubleshooting Checklist

### Error 500
- [ ] Cek file `.env` sudah benar
- [ ] Cek file `.htaccess` sudah ada
- [ ] Cek permission folder `storage`
- [ ] Cek log di `storage/logs/laravel.log`

### Error Database
- [ ] Cek konfigurasi database di `.env`
- [ ] Pastikan database dan user sudah dibuat
- [ ] Test koneksi database

### Assets Tidak Load
- [ ] Pastikan folder `public` sudah di root
- [ ] Cek permission folder `assets`
- [ ] Jalankan `php artisan storage:link`

## 📞 Support

Jika ada masalah:
1. Cek log error di `storage/logs/laravel.log`
2. Pastikan semua file ter-upload dengan benar
3. Hubungi support Hostinger jika perlu

---

**Setelah semua checklist selesai, website PowerPro Anda akan live di https://powerpro.cloud** 🎉



