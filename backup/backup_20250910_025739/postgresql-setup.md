# Setup PostgreSQL untuk PowerPro Local

## Status Saat Ini
✅ **Laravel Framework**: Sudah terpasang (Laravel 11.0)
✅ **Database SQLite**: Sudah berfungsi
✅ **Server Laravel**: Berjalan di http://localhost:8000

## Konfigurasi PostgreSQL

### 1. Install PostgreSQL Extension di XAMPP

1. Buka file `C:\xampp\php\php.ini`
2. Cari baris `;extension=pdo_pgsql` dan hapus tanda `;` di depannya
3. Cari baris `;extension=pgsql` dan hapus tanda `;` di depannya
4. Restart Apache di XAMPP Control Panel

### 2. Install PostgreSQL Server

1. Download PostgreSQL dari https://www.postgresql.org/download/windows/
2. Install dengan default settings
3. Set password untuk user `postgres`
4. Pastikan service PostgreSQL berjalan

### 3. Konfigurasi Database

1. Buka pgAdmin atau command line PostgreSQL
2. Buat database baru:
```sql
CREATE DATABASE powerpro_local;
CREATE USER powerpro_user WITH PASSWORD 'your_password';
GRANT ALL PRIVILEGES ON DATABASE powerpro_local TO powerpro_user;
```

### 4. Update File .env

Ubah konfigurasi database di file `.env`:

```env
# Database Configuration - PostgreSQL
DB_CONNECTION=pgsql
DB_HOST=127.0.0.1
DB_PORT=5432
DB_DATABASE=powerpro_local
DB_USERNAME=powerpro_user
DB_PASSWORD=your_password
```

### 5. Jalankan Migrasi

```bash
C:\xampp\php\php.exe artisan migrate:fresh
```

## Alternatif: Gunakan Docker

Jika ingin menggunakan Docker, jalankan:

```bash
docker-compose up -d
```

Ini akan menjalankan PostgreSQL dalam container Docker.

## Test Koneksi

Setelah konfigurasi selesai, test dengan:

```bash
C:\xampp\php\php.exe artisan tinker
```

Kemudian di tinker:
```php
DB::connection()->getPdo();
```

Jika berhasil, akan menampilkan informasi koneksi PostgreSQL.
