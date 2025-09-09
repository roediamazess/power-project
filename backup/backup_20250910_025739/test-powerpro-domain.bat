@echo off
echo ========================================
echo    Test PowerPro Domain Access
echo ========================================
echo.

echo [1/4] Cek status Docker containers...
docker-compose -f docker-compose.domain.yml ps
echo.

echo [2/4] Cek logs aplikasi...
docker-compose -f docker-compose.domain.yml logs --tail=10 app
echo.

echo [3/4] Test akses HTTP...
curl -k http://powerpro.cloud
echo.

echo [4/4] Test akses HTTPS...
curl -k https://powerpro.cloud
echo.

echo ========================================
echo    Test Selesai!
echo ========================================
echo.
echo Jika tidak ada error, buka browser dan akses:
echo - https://powerpro.cloud
echo - https://www.powerpro.cloud
echo.
echo Catatan:
echo - Browser akan menampilkan warning SSL
echo - Klik "Advanced" dan "Proceed to powerpro.cloud"
echo.
pause


