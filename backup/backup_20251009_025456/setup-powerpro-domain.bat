@echo off
echo ========================================
echo    PowerPro Domain Setup Script
echo ========================================
echo.

echo [1/6] Mengupdate file hosts...
echo 127.0.0.1 powerpro.cloud >> C:\Windows\System32\drivers\etc\hosts
echo 127.0.0.1 www.powerpro.cloud >> C:\Windows\System32\drivers\etc\hosts
echo ✓ File hosts telah diupdate
echo.

echo [2/6] Membuat file .env...
if not exist .env (
    copy env.domain.example .env
    echo ✓ File .env telah dibuat
) else (
    echo ✓ File .env sudah ada
)
echo.

echo [3/6] Generate APP_KEY...
php artisan key:generate
echo ✓ APP_KEY telah di-generate
echo.

echo [4/6] Membuat SSL certificate...
if not exist docker\ssl\powerpro.cloud.crt (
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout docker\ssl\powerpro.cloud.key -out docker\ssl\powerpro.cloud.crt -subj "/C=ID/ST=Jakarta/L=Jakarta/O=PowerPro/CN=powerpro.cloud"
    echo ✓ SSL certificate telah dibuat
) else (
    echo ✓ SSL certificate sudah ada
)
echo.

echo [5/6] Menjalankan Docker containers...
docker-compose -f docker-compose.domain.yml up -d
echo ✓ Docker containers sedang berjalan
echo.

echo [6/6] Testing domain...
timeout /t 5 /nobreak > nul
curl -k https://powerpro.cloud
echo.
echo ✓ Testing selesai
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


