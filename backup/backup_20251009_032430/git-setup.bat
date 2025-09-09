@echo off
echo ========================================
echo    PowerPro - Git Setup
echo ========================================
echo.

echo [1/4] Initializing Git repository...
git init
echo.

echo [2/4] Adding remote origin...
git remote add origin https://github.com/roediamazess/power-project.git
echo.

echo [3/4] Adding all files...
git add .
echo.

echo [4/4] Making initial commit...
git commit -m "Initial commit: Laravel 11.0 PowerPro project setup

- Laravel 11.0 framework installation
- PostgreSQL database configuration
- SQLite fallback database
- Docker support and configuration
- SSL/HTTPS setup scripts
- Development environment ready
- Comprehensive documentation"
echo.

echo Git setup completed!
echo Run 'update-github.bat' to push changes to GitHub
echo.
pause
