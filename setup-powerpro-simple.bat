@echo off
echo ========================================
echo    PowerPro Domain Setup - Simple
echo ========================================
echo.

echo [1/5] Mengupdate file hosts...
echo 127.0.0.1 powerpro.cloud >> C:\Windows\System32\drivers\etc\hosts
echo 127.0.0.1 www.powerpro.cloud >> C:\Windows\System32\drivers\etc\hosts
echo ✓ File hosts telah diupdate
echo.

echo [2/5] Membuat file .env...
if not exist .env (
    copy env.domain.example .env
    echo ✓ File .env telah dibuat
) else (
    echo ✓ File .env sudah ada
)
echo.

echo [3/5] Generate APP_KEY...
C:\xampp\php\php.exe artisan key:generate
echo ✓ APP_KEY telah di-generate
echo.

echo [4/5] Membuat SSL certificate...
if not exist docker\ssl\powerpro.cloud.crt (
    C:\xampp\php\php.exe -r "echo 'Creating SSL certificate...';"
    echo ✓ SSL certificate akan dibuat saat Docker berjalan
) else (
    echo ✓ SSL certificate sudah ada
)
echo.

echo [5/5] Menjalankan Docker containers...
docker-compose -f docker-compose.domain.yml up -d
echo ✓ Docker containers sedang berjalan
echo.

echo ========================================
echo    Setup Selesai!
echo ========================================
echo.
echo Website Anda sekarang dapat diakses di:
echo - https://powerpro.cloud
echo - https://www.powerpro.cloud
echo.
echo Catatan:
echo - Browser akan menampilkan warning SSL karena menggunakan self-signed certificate
echo - Klik "Advanced" dan "Proceed to powerpro.cloud" untuk melanjutkan
echo.
echo Untuk menghentikan server:
echo docker-compose -f docker-compose.domain.yml down
echo.
pause



