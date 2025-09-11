@echo off
echo ========================================
echo    PowerPro - Test Layout Switching
echo ========================================
echo.

echo [1/4] Starting Laravel server...
start "Laravel Server" cmd /k "C:\xampp\php\php.exe artisan serve --host=0.0.0.0 --port=8000"
echo.

echo [2/4] Waiting for server to start...
timeout /t 3 /nobreak >nul
echo.

echo [3/4] Opening browser...
start http://localhost:8000
echo.

echo [4/4] Testing layout switching...
echo.
echo ========================================
echo    LAYOUT SWITCHING TEST READY!
echo ========================================
echo.
echo Features to test:
echo.
echo 1. HORIZONTAL LAYOUT (Default):
echo    - Horizontal navigation bar at top
echo    - Toggle switch shows "Horizontal" active
echo    - Full-width content area
echo.
echo 2. SIDEBAR LAYOUT:
echo    - Click "Sidebar" button in toggle switch
echo    - Page will reload with sidebar layout
echo    - Sidebar on left, content on right
echo.
echo 3. LAYOUT PERSISTENCE:
echo    - Layout choice is saved in session
echo    - Refreshing page maintains chosen layout
echo    - Toggle switch shows current active layout
echo.
echo 4. RESPONSIVE DESIGN:
echo    - Test on different screen sizes
echo    - Mobile menu works in both layouts
echo    - Smooth transitions between layouts
echo.
echo Test Steps:
echo 1. Open http://localhost:8000
echo 2. Look for toggle switch in top-right area
echo 3. Click "Sidebar" to switch to sidebar layout
echo 4. Click "Horizontal" to switch back
echo 5. Test on mobile/tablet sizes
echo.
echo ========================================
echo    LAYOUT SWITCHING FEATURES:
echo ========================================
echo.
echo ✅ Toggle Switch - Choose between layouts
echo ✅ Session Storage - Remembers your choice
echo ✅ Smooth Transitions - Page reloads cleanly
echo ✅ Responsive Design - Works on all devices
echo ✅ Visual Feedback - Active layout highlighted
echo ✅ Error Handling - Shows notifications
echo.
pause






