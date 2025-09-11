@echo off
echo ========================================
echo    PowerPro - Website Backup System
echo ========================================
echo.

set BACKUP_DATE=%date:~-4,4%%date:~-10,2%%date:~-7,2%_%time:~0,2%%time:~3,2%%time:~6,2%
set BACKUP_DATE=%BACKUP_DATE: =0%
set BACKUP_DIR=backup\backup_%BACKUP_DATE%

echo [1/8] Creating backup directory...
mkdir "%BACKUP_DIR%"
mkdir "%BACKUP_DIR%\database"
mkdir "%BACKUP_DIR%\files"
mkdir "%BACKUP_DIR%\config"
mkdir "%BACKUP_DIR%\storage"
echo Backup directory: %BACKUP_DIR%
echo.

echo [2/8] Backing up database...
copy "database\database.sqlite" "%BACKUP_DIR%\database\"
echo Database backed up successfully
echo.

echo [3/8] Backing up configuration files...
copy ".env" "%BACKUP_DIR%\config\"
copy "config\*.php" "%BACKUP_DIR%\config\"
copy "composer.json" "%BACKUP_DIR%\config\"
copy "composer.lock" "%BACKUP_DIR%\config\"
echo Configuration files backed up
echo.

echo [4/8] Backing up application files...
xcopy "app" "%BACKUP_DIR%\files\app\" /E /I /Y
xcopy "resources" "%BACKUP_DIR%\files\resources\" /E /I /Y
xcopy "routes" "%BACKUP_DIR%\files\routes\" /E /I /Y
xcopy "public" "%BACKUP_DIR%\files\public\" /E /I /Y
echo Application files backed up
echo.

echo [5/8] Backing up storage directory...
xcopy "storage" "%BACKUP_DIR%\storage\" /E /I /Y
echo Storage directory backed up
echo.

echo [6/8] Backing up documentation...
copy "*.md" "%BACKUP_DIR%\"
copy "*.bat" "%BACKUP_DIR%\"
copy "*.sh" "%BACKUP_DIR%\"
echo Documentation backed up
echo.

echo [7/8] Creating backup manifest...
echo PowerPro Website Backup > "%BACKUP_DIR%\BACKUP_INFO.txt"
echo ================================ >> "%BACKUP_DIR%\BACKUP_INFO.txt"
echo. >> "%BACKUP_DIR%\BACKUP_INFO.txt"
echo Backup Date: %date% %time% >> "%BACKUP_DIR%\BACKUP_INFO.txt"
echo Backup Directory: %BACKUP_DIR% >> "%BACKUP_DIR%\BACKUP_INFO.txt"
echo. >> "%BACKUP_DIR%\BACKUP_INFO.txt"
echo Contents: >> "%BACKUP_DIR%\BACKUP_INFO.txt"
echo - Database: database.sqlite >> "%BACKUP_DIR%\BACKUP_INFO.txt"
echo - Configuration: .env, config files >> "%BACKUP_DIR%\BACKUP_INFO.txt"
echo - Application: app, resources, routes, public >> "%BACKUP_DIR%\BACKUP_INFO.txt"
echo - Storage: storage directory >> "%BACKUP_DIR%\BACKUP_INFO.txt"
echo - Documentation: README, guides, scripts >> "%BACKUP_DIR%\BACKUP_INFO.txt"
echo. >> "%BACKUP_DIR%\BACKUP_INFO.txt"
echo To restore: Run restore-website.bat >> "%BACKUP_DIR%\BACKUP_INFO.txt"
echo.

echo [8/8] Creating compressed backup...
powershell -Command "Compress-Archive -Path '%BACKUP_DIR%' -DestinationPath 'backup\powerpro_backup_%BACKUP_DATE%.zip' -Force"
echo Compressed backup created: backup\powerpro_backup_%BACKUP_DATE%.zip
echo.

echo ========================================
echo    BACKUP COMPLETED SUCCESSFULLY!
echo ========================================
echo.
echo Backup Location: %BACKUP_DIR%
echo Compressed File: backup\powerpro_backup_%BACKUP_DATE%.zip
echo.
echo You can now safely update your website!
echo.
pause








