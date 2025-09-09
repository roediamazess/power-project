@echo off
echo ========================================
echo    Debug PowerPro Domain
echo ========================================
echo.

echo [1/6] Cek status containers...
docker-compose -f docker-compose.domain.yml ps
echo.

echo [2/6] Cek logs nginx...
docker-compose -f docker-compose.domain.yml logs --tail=5 nginx
echo.

echo [3/6] Cek logs app...
docker-compose -f docker-compose.domain.yml logs --tail=5 app
echo.

echo [4/6] Test HTTP localhost...
curl http://localhost
echo.

echo [5/6] Test HTTP powerpro.cloud...
curl http://powerpro.cloud
echo.

echo [6/6] Cek file hosts...
type C:\Windows\System32\drivers\etc\hosts | findstr powerpro
echo.

echo ========================================
echo    Debug Selesai!
echo ========================================
echo.
echo Jika ada error, cek:
echo 1. Docker containers berjalan
echo 2. File hosts sudah diupdate
echo 3. Nginx configuration benar
echo.
pause


