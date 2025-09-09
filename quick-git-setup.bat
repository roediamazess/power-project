@echo off
echo ========================================
echo    PowerPro - Quick Git Setup
echo ========================================
echo.

echo [1/4] Initializing Git repository...
git init
echo.

echo [2/4] Adding all files...
git add .
echo.

echo [3/4] Making commit...
git commit -m "feat: Setup Laravel 11.0 with PostgreSQL configuration"
echo.

echo [4/4] Adding remote and pushing...
git remote add origin https://github.com/roediamazess/power-project.git
git push -u origin master
echo.

echo Setup completed!
echo Repository: https://github.com/roediamazess/power-project
echo.
pause
