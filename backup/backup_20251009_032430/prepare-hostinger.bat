@echo off
echo ========================================
echo    PowerPro - Hostinger Preparation
echo ========================================
echo.

echo [1/6] Installing dependencies...
call composer install --optimize-autoloader --no-dev
if %errorlevel% neq 0 (
    echo ERROR: Composer install failed!
    pause
    exit /b 1
)

echo.
echo [2/6] Building assets...
call npm run build
if %errorlevel% neq 0 (
    echo ERROR: NPM build failed!
    pause
    exit /b 1
)

echo.
echo [3/6] Creating production environment file...
if not exist .env.production (
    copy env.production.example .env.production
    echo Created .env.production from template
) else (
    echo .env.production already exists
)

echo.
echo [4/6] Generating application key...
C:\xampp\php\php.exe artisan key:generate --env=production
if %errorlevel% neq 0 (
    echo WARNING: Could not generate key for production
)

echo.
echo [5/6] Optimizing application...
C:\xampp\php\php.exe artisan config:cache
C:\xampp\php\php.exe artisan route:cache
C:\xampp\php\php.exe artisan view:cache

echo.
echo [6/6] Creating upload package...
if exist powerpro-upload.zip del powerpro-upload.zip

echo Creating ZIP file for upload...
powershell -command "Compress-Archive -Path 'app','bootstrap','config','database','resources','routes','storage','vendor','artisan','composer.json','composer.lock','.env.production','public\*' -DestinationPath 'powerpro-upload.zip' -Force"

if exist powerpro-upload.zip (
    echo.
    echo ========================================
    echo           PREPARATION COMPLETE!
    echo ========================================
    echo.
    echo Files ready for upload:
    echo - powerpro-upload.zip (main application)
    echo - HOSTINGER_DEPLOYMENT.md (deployment guide)
    echo.
    echo Next steps:
    echo 1. Extract powerpro-upload.zip to public_html
    echo 2. Move contents of 'public' folder to root of public_html
    echo 3. Configure database in Hostinger
    echo 4. Update .env.production with your database credentials
    echo 5. Run: php artisan migrate
    echo.
    echo For detailed instructions, see HOSTINGER_DEPLOYMENT.md
) else (
    echo ERROR: Failed to create upload package!
)

echo.
pause



