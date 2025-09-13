@echo off
echo ========================================
echo    PowerPro - Update to GitHub
echo ========================================
echo.

echo [1/5] Checking Git status...
git status
echo.

echo [2/5] Adding all changes to staging area...
git add .
echo.

echo [3/5] Committing changes...
git commit -m "feat: Setup Laravel 11.0 with PostgreSQL configuration

- Configure Laravel 11.0 framework
- Setup PostgreSQL database configuration
- Add SQLite as fallback database
- Create comprehensive README.md
- Add PostgreSQL setup guide
- Configure development environment
- Fix Redis configuration issues
- Add Docker support files
- Setup SSL/HTTPS configuration"
echo.

echo [4/5] Pushing to GitHub...
git push origin master
echo.

echo [5/5] Update completed!
echo.
echo Repository: https://github.com/roediamazess/power-project
echo.
pause
