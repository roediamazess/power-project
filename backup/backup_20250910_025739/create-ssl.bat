@echo off
echo ========================================
echo    Creating SSL Certificate
echo ========================================
echo.

echo [1/3] Creating SSL directory...
if not exist docker\ssl mkdir docker\ssl

echo [2/3] Creating SSL certificate using Docker...
docker run --rm -v "%cd%\docker\ssl:/certs" alpine/openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /certs/powerpro.cloud.key -out /certs/powerpro.cloud.crt -subj "/C=ID/ST=Jakarta/L=Jakarta/O=PowerPro/CN=powerpro.cloud"

echo [3/3] Restarting Nginx container...
docker-compose -f docker-compose.domain.yml restart nginx

echo.
echo ========================================
echo    SSL Certificate Created!
echo ========================================
echo.
echo Certificate files created:
echo - docker\ssl\powerpro.cloud.crt
echo - docker\ssl\powerpro.cloud.key
echo.
echo Now try accessing: https://powerpro.cloud
echo.
pause


