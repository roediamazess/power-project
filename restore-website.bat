@echo off
echo ========================================
echo    PowerPro - Website Restore System
echo ========================================
echo.

echo Available backups:
dir backup\backup_* /B
echo.

set /p BACKUP_NAME="Enter backup folder name (e.g., backup_20250110_143000): "
set BACKUP_PATH=backup\%BACKUP_NAME%

if not exist "%BACKUP_PATH%" (
    echo ERROR: Backup folder not found!
    echo Available backups:
    dir backup\backup_* /B
    pause
    exit /b 1
)

echo.
echo [1/6] Restoring database...
if exist "%BACKUP_PATH%\database\database.sqlite" (
    copy "%BACKUP_PATH%\database\database.sqlite" "database\"
    echo Database restored successfully
) else (
    echo WARNING: Database file not found in backup
)
echo.

echo [2/6] Restoring configuration files...
if exist "%BACKUP_PATH%\config\.env" (
    copy "%BACKUP_PATH%\config\.env" "."
    echo .env restored
)
if exist "%BACKUP_PATH%\config\*.php" (
    copy "%BACKUP_PATH%\config\*.php" "config\"
    echo Config files restored
)
if exist "%BACKUP_PATH%\config\composer.json" (
    copy "%BACKUP_PATH%\config\composer.json" "."
    echo composer.json restored
)
echo.

echo [3/6] Restoring application files...
if exist "%BACKUP_PATH%\files\app" (
    xcopy "%BACKUP_PATH%\files\app" "app\" /E /I /Y
    echo App directory restored
)
if exist "%BACKUP_PATH%\files\resources" (
    xcopy "%BACKUP_PATH%\files\resources" "resources\" /E /I /Y
    echo Resources directory restored
)
if exist "%BACKUP_PATH%\files\routes" (
    xcopy "%BACKUP_PATH%\files\routes" "routes\" /E /I /Y
    echo Routes directory restored
)
if exist "%BACKUP_PATH%\files\public" (
    xcopy "%BACKUP_PATH%\files\public" "public\" /E /I /Y
    echo Public directory restored
)
echo.

echo [4/6] Restoring storage directory...
if exist "%BACKUP_PATH%\storage" (
    xcopy "%BACKUP_PATH%\storage" "storage\" /E /I /Y
    echo Storage directory restored
)
echo.

echo [5/6] Restoring documentation...
if exist "%BACKUP_PATH%\*.md" (
    copy "%BACKUP_PATH%\*.md" "."
    echo Documentation restored
)
if exist "%BACKUP_PATH%\*.bat" (
    copy "%BACKUP_PATH%\*.bat" "."
    echo Scripts restored
)
echo.

echo [6/6] Verifying restore...
if exist "database\database.sqlite" (
    echo ✓ Database file exists
) else (
    echo ✗ Database file missing
)
if exist ".env" (
    echo ✓ Environment file exists
) else (
    echo ✗ Environment file missing
)
if exist "app" (
    echo ✓ Application directory exists
) else (
    echo ✗ Application directory missing
)
echo.

echo ========================================
echo    RESTORE COMPLETED!
echo ========================================
echo.
echo Your website has been restored from backup: %BACKUP_NAME%
echo.
echo Next steps:
echo 1. Run: C:\xampp\php\php.exe artisan serve
echo 2. Check your website at http://localhost:8000
echo.
pause





