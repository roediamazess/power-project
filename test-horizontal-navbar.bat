@echo off
echo ========================================
echo    PowerPro - Test Horizontal Navbar
echo ========================================
echo.

echo [1/3] Starting Laravel server...
start "Laravel Server" cmd /k "C:\xampp\php\php.exe artisan serve --host=0.0.0.0 --port=8000"
echo.

echo [2/3] Waiting for server to start...
timeout /t 3 /nobreak >nul
echo.

echo [3/3] Opening browser...
start http://localhost:8000
echo.

echo ========================================
echo    HORIZONTAL NAVBAR TEST READY!
echo ========================================
echo.
echo Your website is now running with horizontal navbar!
echo.
echo Features:
echo - Horizontal navigation bar instead of sidebar
echo - Responsive design for mobile and desktop
echo - Dropdown menus for better organization
echo - Mobile menu for small screens
echo - Theme toggle functionality
echo - Search functionality
echo - Notification and message dropdowns
echo.
echo Open http://localhost:8000 to see the changes
echo.
pause
