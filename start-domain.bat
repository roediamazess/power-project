@echo off
echo ========================================
echo    PowerPro - Start Domain Setup
echo ========================================
echo.

echo [1/5] Checking Docker Desktop...
docker --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Docker Desktop tidak berjalan!
    echo Silakan buka Docker Desktop dan tunggu sampai status "Running"
    pause
    exit /b 1
)
echo ✅ Docker Desktop berjalan

echo.
echo [2/5] Starting services...
docker-compose -f docker-compose.simple.yml up -d

echo.
echo [3/5] Checking services status...
docker-compose -f docker-compose.simple.yml ps

echo.
echo [4/5] Testing local access...
timeout /t 5 /nobreak >nul
curl -s -o nul -w "HTTP Status: %%{http_code}\n" http://localhost
if %errorlevel% neq 0 (
    echo ❌ Local HTTP tidak bisa diakses
    echo Cek log: docker-compose -f docker-compose.simple.yml logs
) else (
    echo ✅ Local HTTP bisa diakses
)

echo.
echo [5/5] Getting public IP...
echo Public IP Anda: 
curl -s ifconfig.me
echo.

echo.
echo ========================================
echo           SERVICES STARTED!
echo ========================================
echo.
echo Website running at:
echo - Local: http://localhost
echo - Domain: http://powerpro.cloud (setelah DNS update)
echo.
echo Next steps:
echo 1. Konfigurasi DNS di Hostinger dengan IP di atas
echo 2. Setup port forwarding di router (port 80)
echo 3. Tunggu DNS propagation (5-15 menit)
echo 4. Test akses domain
echo.
echo For detailed instructions, see DOMAIN_SETUP_COMPLETE.md
echo.
pause



