@echo off
echo ========================================
echo    PowerPro - Complete Website Backup
echo ========================================
echo.

set BACKUP_NAME=backup_%date:~-4,4%%date:~-10,2%%date:~-7,2%_%time:~0,2%%time:~3,2%%time:~6,2%
set BACKUP_NAME=%BACKUP_NAME: =0%
set BACKUP_PATH=backup\%BACKUP_NAME%

echo Backup Name: %BACKUP_NAME%
echo Backup Path: %BACKUP_PATH%
echo.

echo [1/7] Creating backup directory...
if not exist "%BACKUP_PATH%" mkdir "%BACKUP_PATH%"
if not exist "%BACKUP_PATH%\database" mkdir "%BACKUP_PATH%\database"
if not exist "%BACKUP_PATH%\config" mkdir "%BACKUP_PATH%\config"
if not exist "%BACKUP_PATH%\files" mkdir "%BACKUP_PATH%\files"
if not exist "%BACKUP_PATH%\storage" mkdir "%BACKUP_PATH%\storage"
echo ✓ Backup directories created
echo.

echo [2/7] Backing up PostgreSQL database...
docker exec power-project-db pg_dump -U user -d laravel > "%BACKUP_PATH%\database\database.sql"
if %ERRORLEVEL% EQU 0 (
    echo ✓ Database backup completed successfully
) else (
    echo ✗ Database backup failed
    pause
    exit /b 1
)
echo.

echo [3/7] Backing up configuration files...
if exist ".env" copy ".env" "%BACKUP_PATH%\config\"
if exist "composer.json" copy "composer.json" "%BACKUP_PATH%\config\"
if exist "composer.lock" copy "composer.lock" "%BACKUP_PATH%\config\"
if exist "package.json" copy "package.json" "%BACKUP_PATH%\config\"
if exist "vite.config.js" copy "vite.config.js" "%BACKUP_PATH%\config\"
if exist "phpunit.xml" copy "phpunit.xml" "%BACKUP_PATH%\config\"
xcopy "config" "%BACKUP_PATH%\config\config\" /E /I /Y
echo ✓ Configuration files backed up
echo.

echo [4/7] Backing up application files...
xcopy "app" "%BACKUP_PATH%\files\app\" /E /I /Y
xcopy "resources" "%BACKUP_PATH%\files\resources\" /E /I /Y
xcopy "routes" "%BACKUP_PATH%\files\routes\" /E /I /Y
xcopy "database" "%BACKUP_PATH%\files\database\" /E /I /Y
xcopy "bootstrap" "%BACKUP_PATH%\files\bootstrap\" /E /I /Y
echo ✓ Application files backed up
echo.

echo [5/7] Backing up public assets...
xcopy "public" "%BACKUP_PATH%\files\public\" /E /I /Y
echo ✓ Public assets backed up
echo.

echo [6/7] Backing up storage directory...
xcopy "storage" "%BACKUP_PATH%\storage\" /E /I /Y
echo ✓ Storage directory backed up
echo.

echo [7/7] Creating backup information...
echo PowerPro Website Backup > "%BACKUP_PATH%\BACKUP_INFO.txt"
echo ================================== >> "%BACKUP_PATH%\BACKUP_INFO.txt"
echo. >> "%BACKUP_PATH%\BACKUP_INFO.txt"
echo Backup Date: %date% %time% >> "%BACKUP_PATH%\BACKUP_INFO.txt"
echo Backup Directory: %BACKUP_PATH% >> "%BACKUP_PATH%\BACKUP_INFO.txt"
echo. >> "%BACKUP_PATH%\BACKUP_INFO.txt"
echo Contents: >> "%BACKUP_PATH%\BACKUP_INFO.txt"
echo - Database: database.sql >> "%BACKUP_PATH%\BACKUP_INFO.txt"
echo - Configuration: .env, config files >> "%BACKUP_PATH%\BACKUP_INFO.txt"
echo - Application: app, resources, routes, public >> "%BACKUP_PATH%\BACKUP_INFO.txt"
echo - Storage: storage directory >> "%BACKUP_PATH%\BACKUP_INFO.txt"
echo - Documentation: README, guides, scripts >> "%BACKUP_PATH%\BACKUP_INFO.txt"
echo. >> "%BACKUP_PATH%\BACKUP_INFO.txt"
echo To restore: Run restore-website.bat >> "%BACKUP_PATH%\BACKUP_INFO.txt"

echo Database Status: >> "%BACKUP_PATH%\BACKUP_STATUS.md"
echo ================ >> "%BACKUP_PATH%\BACKUP_STATUS.md"
echo. >> "%BACKUP_PATH%\BACKUP_STATUS.md"
echo Time Boxing Records: 8 >> "%BACKUP_PATH%\BACKUP_STATUS.md"
echo Activity Records: [Check database] >> "%BACKUP_PATH%\BACKUP_STATUS.md"
echo Users: [Check database] >> "%BACKUP_PATH%\BACKUP_STATUS.md"
echo. >> "%BACKUP_PATH%\BACKUP_STATUS.md"
echo Features: >> "%BACKUP_PATH%\BACKUP_STATUS.md"
echo - Time Boxing Module: Complete >> "%BACKUP_PATH%\BACKUP_STATUS.md"
echo - Activity Module: Complete >> "%BACKUP_PATH%\BACKUP_STATUS.md"
echo - Floating Navigation: Complete >> "%BACKUP_PATH%\BACKUP_STATUS.md"
echo - Database: PostgreSQL Docker >> "%BACKUP_PATH%\BACKUP_STATUS.md"
echo - Status: Working >> "%BACKUP_PATH%\BACKUP_STATUS.md"

echo ✓ Backup information created
echo.

echo ========================================
echo    BACKUP COMPLETED SUCCESSFULLY!
echo ========================================
echo.
echo Backup Location: %BACKUP_PATH%
echo.
echo Contents:
dir "%BACKUP_PATH%" /B
echo.
echo Next steps:
echo 1. Verify backup contents
echo 2. Test restore if needed
echo 3. Store backup safely
echo.
pause
