@echo off
echo ========================================
echo    PowerPro - Status Check
echo ========================================
echo.

echo [1/6] Checking Docker status...
docker --version
if %errorlevel% neq 0 (
    echo ❌ Docker tidak terinstall
) else (
    echo ✅ Docker terinstall
)

echo.
echo [2/6] Checking Docker Compose status...
docker-compose --version
if %errorlevel% neq 0 (
    echo ❌ Docker Compose tidak terinstall
) else (
    echo ✅ Docker Compose terinstall
)

echo.
echo [3/6] Checking containers...
docker-compose -f docker-compose.domain.yml ps

echo.
echo [4/6] Checking local access...
curl -s -o nul -w "HTTP Status: %%{http_code}\n" http://localhost
if %errorlevel% neq 0 (
    echo ❌ Local HTTP tidak bisa diakses
) else (
    echo ✅ Local HTTP bisa diakses
)

echo.
echo [5/6] Checking SSL certificate...
if exist docker\ssl\powerpro.cloud.crt (
    echo ✅ SSL certificate ada
) else (
    echo ❌ SSL certificate tidak ada
    echo Jalankan generate-ssl.bat untuk membuat certificate
)

echo.
echo [6/6] Checking public IP...
echo Public IP Anda:
curl -s ifconfig.me
echo.

echo.
echo ========================================
echo           STATUS CHECK COMPLETE
echo ========================================
echo.
echo Next steps:
echo 1. Jika Docker belum running, jalankan: docker-compose -f docker-compose.domain.yml up -d
echo 2. Jika SSL belum ada, jalankan: generate-ssl.bat
echo 3. Konfigurasi DNS di Hostinger dengan IP publik di atas
echo 4. Setup port forwarding di router (80 dan 443)
echo.
pause



