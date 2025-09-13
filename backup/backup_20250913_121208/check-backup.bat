@echo off
echo ========================================
echo    PowerPro - Backup Verification
echo ========================================
echo.

echo [1/4] Checking backup directory...
if exist "backup" (
    echo ✓ Backup directory exists
    dir backup /b
) else (
    echo ✗ Backup directory not found
)
echo.

echo [2/4] Checking database backup...
if exist "backup\database_backup.sqlite" (
    echo ✓ Database backup exists
    dir backup\database_backup.sqlite
) else (
    echo ✗ Database backup not found
)
echo.

echo [3/4] Checking environment backup...
if exist "backup\env_backup.txt" (
    echo ✓ Environment backup exists
    dir backup\env_backup.txt
) else (
    echo ✗ Environment backup not found
)
echo.

echo [4/4] Checking all backup files...
dir backup /s
echo.

echo ========================================
echo    BACKUP VERIFICATION COMPLETE
echo ========================================
echo.
pause








