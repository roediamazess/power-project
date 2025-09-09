# PowerPro Project

## Deskripsi
PowerPro adalah aplikasi web yang dibangun dengan Laravel framework dan siap untuk menggunakan database PostgreSQL.

## Status Proyek
- ✅ **Laravel 11.0** - Framework terpasang dan berfungsi
- ✅ **Database SQLite** - Berfungsi sebagai database sementara
- ✅ **PostgreSQL Ready** - Konfigurasi siap untuk PostgreSQL
- ✅ **Server Development** - Berjalan di http://localhost:8000

## Fitur Utama
- Framework Laravel 11.0 (versi terbaru)
- Konfigurasi database PostgreSQL
- Docker support untuk development
- CDN configuration
- Telescope untuk debugging
- SSL/HTTPS support

## Instalasi

### Prerequisites
- PHP 8.2+
- Composer
- XAMPP (untuk development lokal)
- PostgreSQL (opsional, bisa menggunakan SQLite)

### Setup Lokal
1. Clone repository ini
2. Install dependencies:
   ```bash
   composer install
   ```
3. Copy file environment:
   ```bash
   copy .env.example .env
   ```
4. Generate application key:
   ```bash
   php artisan key:generate
   ```
5. Jalankan migrasi:
   ```bash
   php artisan migrate
   ```
6. Start development server:
   ```bash
   php artisan serve
   ```

### Konfigurasi PostgreSQL
Lihat file `postgresql-setup.md` untuk panduan lengkap konfigurasi PostgreSQL.

## Struktur Proyek
```
power-project/
├── app/                    # Application logic
├── config/                 # Configuration files
├── database/              # Database migrations & seeders
├── docker/                # Docker configurations
├── public/                # Public assets
├── resources/             # Views, CSS, JS
├── routes/                # Route definitions
├── storage/               # File storage
└── tests/                 # Test files
```

## Development
- **Framework**: Laravel 11.0
- **Database**: PostgreSQL (default), SQLite (development)
- **Cache**: Database/File
- **Session**: Database/File
- **Queue**: Database

## Deployment
Proyek ini sudah dikonfigurasi untuk deployment dengan:
- Docker support
- SSL/HTTPS configuration
- CDN integration
- Domain setup scripts

## Kontribusi
1. Fork repository ini
2. Buat feature branch
3. Commit perubahan
4. Push ke branch
5. Buat Pull Request

## Lisensi
MIT License