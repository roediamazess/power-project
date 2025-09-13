@echo off
echo ========================================
echo    Fix PowerPro Domain Access
echo ========================================
echo.

echo [1/5] Menghentikan semua containers...
docker-compose -f docker-compose.domain.yml down
docker-compose down
echo.

echo [2/5] Update file hosts...
echo 127.0.0.1 powerpro.cloud >> C:\Windows\System32\drivers\etc\hosts
echo 127.0.0.1 www.powerpro.cloud >> C:\Windows\System32\drivers\etc\hosts
echo ✓ File hosts diupdate
echo.

echo [3/5] Membuat file .env...
if not exist .env (
    copy env.domain.example .env
    echo ✓ File .env dibuat
)
echo.

echo [4/5] Generate APP_KEY...
C:\xampp\php\php.exe artisan key:generate
echo ✓ APP_KEY di-generate
echo.

echo [5/5] Menjalankan dengan konfigurasi default...
docker-compose up -d
echo ✓ Docker containers berjalan
echo.

echo ========================================
echo    Testing Domain Access
echo ========================================
echo.

echo Test HTTP localhost...
curl http://localhost
echo.

echo Test HTTP powerpro.cloud...
curl http://powerpro.cloud
echo.

echo ========================================
echo    Setup Selesai!
echo ========================================
echo.
echo Coba akses di browser:
echo - http://powerpro.cloud
echo - http://localhost
echo.
echo Jika masih error, jalankan:
echo debug-powerpro.bat
echo.
pause



