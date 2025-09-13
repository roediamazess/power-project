@echo off
echo ========================================
echo    PowerPro - Domain Setup dengan Docker
echo ========================================
echo.

echo [1/8] Checking Docker installation...
docker --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: Docker tidak terinstall!
    echo Silakan install Docker Desktop terlebih dahulu.
    pause
    exit /b 1
)
echo Docker sudah terinstall ✓

echo.
echo [2/8] Checking Docker Compose...
docker-compose --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: Docker Compose tidak terinstall!
    pause
    exit /b 1
)
echo Docker Compose sudah terinstall ✓

echo.
echo [3/8] Creating environment file...
if not exist .env (
    copy env.domain.example .env
    echo Created .env from domain template
) else (
    echo .env already exists
)

echo.
echo [4/8] Creating SSL directory...
if not exist docker\ssl mkdir docker\ssl
if not exist docker\certbot\www mkdir docker\certbot\www
if not exist docker\ddns mkdir docker\ddns

echo.
echo [5/8] Generating application key...
C:\xampp\php\php.exe artisan key:generate --show
echo.
echo Silakan copy APP_KEY di atas ke file .env

echo.
echo [6/8] Building Docker images...
docker-compose -f docker-compose.domain.yml build

echo.
echo [7/8] Starting services...
docker-compose -f docker-compose.domain.yml up -d

echo.
echo [8/8] Running database migrations...
docker-compose -f docker-compose.domain.yml exec app php artisan migrate --force

echo.
echo ========================================
echo           SETUP COMPLETE!
echo ========================================
echo.
echo Services running:
echo - Laravel App: http://localhost
echo - Database: localhost:5432
echo - Redis: localhost:6379
echo.
echo Next steps:
echo 1. Update .env with your APP_KEY
echo 2. Configure domain DNS di Hostinger
echo 3. Setup SSL certificate
echo 4. Test domain access
echo.
echo For detailed instructions, see DOMAIN_SETUP_GUIDE.md
echo.
pause



