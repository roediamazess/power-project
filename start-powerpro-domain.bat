@echo off
echo ========================================
echo    Starting PowerPro Domain Server
echo ========================================
echo.

echo Menjalankan Docker containers...
docker-compose -f docker-compose.domain.yml up -d

echo.
echo Menunggu containers siap...
timeout /t 10 /nobreak > nul

echo.
echo ========================================
echo    Server Berjalan!
echo ========================================
echo.
echo Website Anda dapat diakses di:
echo - https://powerpro.cloud
echo - https://www.powerpro.cloud
echo.
echo Untuk melihat logs:
echo docker-compose -f docker-compose.domain.yml logs -f
echo.
echo Untuk menghentikan server:
echo docker-compose -f docker-compose.domain.yml down
echo.

start https://powerpro.cloud
pause
