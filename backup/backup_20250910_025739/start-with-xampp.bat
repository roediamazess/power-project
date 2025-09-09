@echo off
echo ========================================
echo    PowerPro dengan XAMPP
echo ========================================
echo.

echo [1/4] Cek status XAMPP...
if exist "C:\xampp\apache\bin\httpd.exe" (
    echo ✓ Apache ditemukan
) else (
    echo ❌ Apache tidak ditemukan di C:\xampp\apache\
    echo Pastikan XAMPP sudah terinstall
    pause
    exit
)

if exist "C:\xampp\php\php.exe" (
    echo ✓ PHP ditemukan
) else (
    echo ❌ PHP tidak ditemukan di C:\xampp\php\
    echo Pastikan XAMPP sudah terinstall
    pause
    exit
)

echo.
echo [2/4] Update file hosts...
echo 127.0.0.1 powerpro.cloud >> C:\Windows\System32\drivers\etc\hosts
echo 127.0.0.1 www.powerpro.cloud >> C:\Windows\System32\drivers\etc\hosts
echo ✓ File hosts diupdate
echo.

echo [3/4] Setup Laravel...
if not exist .env (
    copy env.domain.example .env
    echo ✓ File .env dibuat
)

C:\xampp\php\php.exe artisan key:generate
echo ✓ APP_KEY di-generate
echo.

echo [4/4] Start XAMPP services...
echo Memulai Apache dan MySQL...
start "" "C:\xampp\xampp-control.exe"
echo.

echo ========================================
echo    Setup Selesai!
echo ========================================
echo.
echo Website dapat diakses di:
echo - http://powerpro.cloud
echo - http://localhost/power-project/public
echo.
echo Pastikan:
echo 1. Apache berjalan di XAMPP Control Panel
echo 2. MySQL berjalan di XAMPP Control Panel
echo 3. Port 80 tidak digunakan aplikasi lain
echo.
echo Untuk mengakses website:
echo 1. Buka XAMPP Control Panel
echo 2. Start Apache dan MySQL
echo 3. Buka browser ke http://powerpro.cloud
echo.
pause


