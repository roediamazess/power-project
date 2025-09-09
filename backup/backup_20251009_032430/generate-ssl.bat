@echo off
echo ========================================
echo    PowerPro - SSL Certificate Generator
echo ========================================
echo.

echo [1/3] Creating SSL directory...
if not exist docker\ssl mkdir docker\ssl

echo.
echo [2/3] Generating self-signed SSL certificate...
cd docker\ssl

openssl req -x509 -nodes -days 365 -newkey rsa:2048 ^
    -keyout powerpro.cloud.key ^
    -out powerpro.cloud.crt ^
    -subj "/C=ID/ST=Jakarta/L=Jakarta/O=PowerPro/CN=powerpro.cloud"

if %errorlevel% neq 0 (
    echo ERROR: OpenSSL tidak terinstall!
    echo Silakan install OpenSSL atau gunakan Git Bash.
    pause
    exit /b 1
)

echo.
echo [3/3] Setting permissions...
icacls powerpro.cloud.key /inheritance:r /grant:r "%USERNAME%:F"
icacls powerpro.cloud.crt /inheritance:r /grant:r "%USERNAME%:F"

cd ..\..

echo.
echo ========================================
echo         SSL CERTIFICATE GENERATED!
echo ========================================
echo.
echo Files created:
echo - docker\ssl\powerpro.cloud.key
echo - docker\ssl\powerpro.cloud.crt
echo.
echo Note: Ini adalah self-signed certificate.
echo Browser akan warning tentang security.
echo Untuk production, gunakan Let's Encrypt.
echo.
pause



