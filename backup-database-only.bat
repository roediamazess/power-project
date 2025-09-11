@echo off
echo ========================================
echo    PowerPro - Database Backup Only
echo ========================================
echo.

set BACKUP_DATE=%date:~-4,4%%date:~-10,2%%date:~-7,2%_%time:~0,2%%time:~3,2%%time:~6,2%
set BACKUP_DATE=%BACKUP_DATE: =0%

echo [1/3] Creating database backup...
mkdir backup\database_backup_%BACKUP_DATE%
copy "database\database.sqlite" "backup\database_backup_%BACKUP_DATE%\database.sqlite"
echo Database backed up to: backup\database_backup_%BACKUP_DATE%\database.sqlite
echo.

echo [2/3] Creating SQL dump...
C:\xampp\php\php.exe artisan tinker --execute="DB::select('SELECT sql FROM sqlite_master WHERE type=\"table\"');" > "backup\database_backup_%BACKUP_DATE%\schema.sql"
echo SQL schema exported
echo.

echo [3/3] Creating backup info...
echo Database Backup Information > "backup\database_backup_%BACKUP_DATE%\BACKUP_INFO.txt"
echo ============================== >> "backup\database_backup_%BACKUP_DATE%\BACKUP_INFO.txt"
echo. >> "backup\database_backup_%BACKUP_DATE%\BACKUP_INFO.txt"
echo Backup Date: %date% %time% >> "backup\database_backup_%BACKUP_DATE%\BACKUP_INFO.txt"
echo Database File: database.sqlite >> "backup\database_backup_%BACKUP_DATE%\BACKUP_INFO.txt"
echo Schema File: schema.sql >> "backup\database_backup_%BACKUP_DATE%\BACKUP_INFO.txt"
echo. >> "backup\database_backup_%BACKUP_DATE%\BACKUP_INFO.txt"
echo To restore database: >> "backup\database_backup_%BACKUP_DATE%\BACKUP_INFO.txt"
echo 1. Stop Laravel server >> "backup\database_backup_%BACKUP_DATE%\BACKUP_INFO.txt"
echo 2. Copy database.sqlite to database\ folder >> "backup\database_backup_%BACKUP_DATE%\BACKUP_INFO.txt"
echo 3. Restart Laravel server >> "backup\database_backup_%BACKUP_DATE%\BACKUP_INFO.txt"
echo.

echo ========================================
echo    DATABASE BACKUP COMPLETED!
echo ========================================
echo.
echo Backup Location: backup\database_backup_%BACKUP_DATE%\
echo.
pause






