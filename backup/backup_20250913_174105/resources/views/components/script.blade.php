    <!-- jQuery library js -->
    <script src="{{ asset('assets/js/lib/jquery-3.7.1.min.js') }}"></script>
    <!-- Apex Chart js -->
    <script src="{{ asset('assets/js/lib/apexcharts.min.js') }}"></script>
    <!-- Data Table js -->
    <script src="{{ asset('assets/js/lib/simple-datatables.min.js') }}"></script>
    <!-- Iconify Font js -->
    <script src="{{ asset('assets/js/lib/iconify-icon.min.js') }}"></script>
    <!-- jQuery UI js -->
    <script src="{{ asset('assets/js/lib/jquery-ui.min.js') }}"></script>
    <!-- Vector Map js -->
    <script src="{{ asset('assets/js/lib/jquery-jvectormap-2.0.5.min.js') }}"></script>
    <script src="{{ asset('assets/js/lib/jquery-jvectormap-world-mill-en.js') }}"></script>
    <!-- Popup js -->
    <script src="{{ asset('assets/js/lib/magnifc-popup.min.js') }}"></script>
    <!-- Slick Slider js -->
    <script src="{{ asset('assets/js/lib/slick.min.js') }}"></script>
    <!-- prism js -->
    <script src="{{ asset('assets/js/lib/prism.js') }}"></script>
    <!-- file upload js -->
    <script src="{{ asset('assets/js/lib/file-upload.js') }}"></script>
    <!-- audio player -->
    <script src="{{ asset('assets/js/lib/audioplayer.js') }}"></script>

    <script src="{{ asset('assets/js/flowbite.min.js') }}"></script>
    <!-- horizontal navbar js -->
    <script src="{{ asset('assets/js/horizontal-navbar.js') }}"></script>
    <!-- notification system js -->
    <script src="{{ asset('assets/js/notifications.js') }}"></script>
    
    <!-- Inline notification system fallback -->
    <script>
        // Enhanced notification system
        window.showNotification = function(message, type = 'info', options = {}) {
            console.log('🔔 Notification:', message, type, options);
            
            // Default options
            const defaultOptions = {
                duration: 5000,
                important: false,
                autoClose: true,
                position: 'below-logo'
            };
            
            const config = { ...defaultOptions, ...options };
            
            // Wait for DOM to be ready
            setTimeout(() => {
                // Create container if not exists
                if (!document.getElementById('notification-container')) {
                    const container = document.createElement('div');
                    container.id = 'notification-container';
                    
                    // Calculate logo position dynamically - target logo in floating capsule
                    const floatingCapsule = document.querySelector('nav.fixed');
                    const logo = floatingCapsule ? floatingCapsule.querySelector('img.rotating-logo') : null;
                    let logoPosition = { top: 100, left: 24 }; // fallback values
                    
                    if (logo && floatingCapsule) {
                        const logoRect = logo.getBoundingClientRect();
                        const capsuleRect = floatingCapsule.getBoundingClientRect();
                        console.log('🎯 Logo rect:', logoRect);
                        console.log('🎯 Capsule rect:', capsuleRect);
                        
                        // Position notification directly below the floating capsule
                        logoPosition = {
                            top: capsuleRect.bottom + 16, // 16px gap below capsule
                            left: capsuleRect.left + 16 // 16px from left edge of capsule
                        };
                        console.log('🎯 Calculated position:', logoPosition);
                    } else {
                        console.log('❌ Logo not found, using fallback position');
                    }
                    
                    container.style.cssText = `
                        position: fixed;
                        top: ${logoPosition.top}px;
                        left: ${logoPosition.left}px;
                        z-index: 1000;
                        display: flex;
                        flex-direction: column;
                        align-items: flex-start;
                        gap: 0.75rem;
                        pointer-events: none;
                        width: auto;
                    `;
                    document.body.appendChild(container);
                }
                
                const container = document.getElementById('notification-container');
                
                // Create notification element
                const notification = document.createElement('div');
                const importantClass = config.important ? ' important' : '';
                notification.className = `notification-capsule notification-${type}${importantClass}`;
                
                // Create close button
                const closeButton = config.autoClose ? `
                    <button class="notification-close" onclick="this.closest('.notification-capsule').remove()">
                        <svg viewBox="0 0 24 24" fill="currentColor">
                            <path d="M18 6L6 18M6 6l12 12" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                        </svg>
                    </button>
                ` : '';
                
                notification.innerHTML = `
                    <div class="flex items-center">
                        <div class="notification-icon bg-white bg-opacity-20 rounded-full w-8 h-8 flex items-center justify-center mr-3">
                            ${getIcon(type)}
                        </div>
                        <div class="notification-content">
                            <p class="notification-message">${message}</p>
                            ${config.autoClose ? `<div class="notification-progress progress-line ${getProgressColor(type)}"></div>` : ''}
                        </div>
                    </div>
                    ${closeButton}
                `;
                
                // Add click to close
                notification.addEventListener('click', (e) => {
                    if (!e.target.closest('.notification-close')) {
                        notification.classList.add('hide');
                        setTimeout(() => notification.remove(), 400);
                    }
                });
                
                container.appendChild(notification);
                
                // Auto remove after specified duration
                if (config.autoClose && config.duration > 0) {
                    setTimeout(() => {
                        if (notification.parentNode) {
                            notification.classList.add('hide');
                            setTimeout(() => notification.remove(), 400);
                        }
                    }, config.duration);
                }
            }, 100); // 100ms delay to ensure DOM is ready
        };
        
        function getIcon(type) {
            const icons = {
                success: '✓',
                error: '✕',
                warning: '⚠',
                info: 'ℹ',
                create: '+',
                update: '↻',
                delete: '🗑'
            };
            return icons[type] || icons.info;
        }
        
        function getProgressColor(type) {
            const colors = {
                success: 'bg-green-400',
                error: 'bg-red-400',
                warning: 'bg-yellow-400',
                info: 'bg-blue-400',
                create: 'bg-purple-400',
                update: 'bg-cyan-400',
                delete: 'bg-orange-400'
            };
            return colors[type] || colors.info;
        }
        
        // Enhanced convenience functions
        window.showSuccess = (msg, options = {}) => showNotification(msg, 'success', options);
        window.showError = (msg, options = {}) => showNotification(msg, 'error', options);
        window.showWarning = (msg, options = {}) => showNotification(msg, 'warning', options);
        window.showInfo = (msg, options = {}) => showNotification(msg, 'info', options);
        window.showCreate = (msg, options = {}) => showNotification(msg, 'create', options);
        window.showUpdate = (msg, options = {}) => showNotification(msg, 'update', options);
        window.showDelete = (msg, options = {}) => showNotification(msg, 'delete', options);
        
        // Special notification functions
        window.showImportant = (msg, type = 'info') => showNotification(msg, type, { important: true, duration: 10000 });
        window.showPersistent = (msg, type = 'info') => showNotification(msg, type, { autoClose: false, duration: 0 });
        window.showQuick = (msg, type = 'info') => showNotification(msg, type, { duration: 2000 });
        
        // Notification management functions
        window.clearAllNotifications = () => {
            const container = document.getElementById('notification-container');
            if (container) {
                container.innerHTML = '';
            }
        };
        
        window.getNotificationCount = () => {
            const container = document.getElementById('notification-container');
            return container ? container.children.length : 0;
        };
        
        // Auto-reposition notifications on window resize
        window.addEventListener('resize', () => {
            const container = document.getElementById('notification-container');
            if (container) {
                const floatingCapsule = document.querySelector('nav.fixed');
                if (floatingCapsule) {
                    const capsuleRect = floatingCapsule.getBoundingClientRect();
                    container.style.top = `${capsuleRect.bottom + 16}px`;
                    container.style.left = `${capsuleRect.left + 16}px`;
                }
            }
        });
        
        console.log('✅ Enhanced notification system loaded');
    </script>
    
    <!-- main js -->
    <script src="{{ asset('assets/js/app.js') }}"></script>

    @stack('scripts')

    <?php echo (isset($script) ? $script   : '')?>