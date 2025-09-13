@echo off
echo ========================================
echo    Fix Docker Issues
echo ========================================
echo.

echo [1/6] Cek Docker status...
docker --version
if %errorlevel% neq 0 (
    echo ❌ Docker tidak terinstall atau tidak berjalan
    echo Silakan install Docker Desktop dari https://docker.com
    pause
    exit
)
echo ✓ Docker terinstall
echo.

echo [2/6] Cek Docker daemon...
docker info
if %errorlevel% neq 0 (
    echo ❌ Docker daemon tidak berjalan
    echo Silakan start Docker Desktop
    pause
    exit
)
echo ✓ Docker daemon berjalan
echo.

echo [3/6] Clean up containers...
docker-compose down
docker system prune -f
echo ✓ Cleanup selesai
echo.

echo [4/6] Update file hosts...
echo 127.0.0.1 powerpro.cloud >> C:\Windows\System32\drivers\etc\hosts
echo 127.0.0.1 www.powerpro.cloud >> C:\Windows\System32\drivers\etc\hosts
echo ✓ File hosts diupdate
echo.

echo [5/6] Setup Laravel...
if not exist .env (
    copy env.domain.example .env
    echo ✓ File .env dibuat
)

C:\xampp\php\php.exe artisan key:generate
echo ✓ APP_KEY di-generate
echo.

echo [6/6] Start Docker containers...
docker-compose up -d --build
echo ✓ Docker containers dimulai
echo.

echo ========================================
echo    Testing
echo ========================================
echo.

echo Cek status containers...
docker-compose ps
echo.

echo Test akses...
timeout /t 5 /nobreak > nul
curl http://powerpro.cloud
echo.

echo ========================================
echo    Selesai!
echo ========================================
echo.
echo Jika masih ada masalah, coba:
echo 1. Restart Docker Desktop
echo 2. Jalankan start-with-xampp.bat sebagai alternatif
echo.
pause



