/**
 * Enhanced Notification System
 * Appears below floating navigation bar on the left side
 * 
 * Features:
 * - Multiple notification types (success, error, warning, info, create, update, delete)
 * - Customizable duration and auto-close behavior
 * - Important notifications with pulsing effect
 * - Persistent notifications that stay until clicked
 * - Auto-repositioning on window resize
 * - Multiple notification support with staggered animations
 * - Modern design with backdrop blur and gradient effects
 */

class NotificationSystem {
    constructor() {
        this.container = null;
        this.notifications = [];
        this.init();
    }

    init() {
        this.createContainer();
        this.setupEventListeners();
        console.log('✅ Enhanced notification system initialized');
    }

    createContainer() {
        if (!document.getElementById('notification-container')) {
            this.container = document.createElement('div');
            this.container.id = 'notification-container';
            this.updatePosition();
            document.body.appendChild(this.container);
        } else {
            this.container = document.getElementById('notification-container');
        }
    }

    updatePosition() {
        if (!this.container) return;

        const floatingCapsule = document.querySelector('nav.fixed');
        let position = { top: 100, left: 24 }; // fallback values

        if (floatingCapsule) {
            const capsuleRect = floatingCapsule.getBoundingClientRect();
            position = {
                top: capsuleRect.bottom + 16, // 16px gap below capsule
                left: capsuleRect.left + 16 // 16px from left edge of capsule
            };
        }

        this.container.style.cssText = `
            position: fixed;
            top: ${position.top}px;
            left: ${position.left}px;
            z-index: 1000;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            gap: 0.75rem;
            pointer-events: none;
            width: auto;
        `;
    }

    setupEventListeners() {
        // Auto-reposition on window resize
        window.addEventListener('resize', () => {
            this.updatePosition();
        });

        // Auto-reposition on scroll (in case nav position changes)
        window.addEventListener('scroll', () => {
            this.updatePosition();
        });
    }

    show(message, type = 'info', options = {}) {
        const defaultOptions = {
            duration: 5000,
            important: false,
            autoClose: true,
            position: 'below-logo'
        };

        const config = { ...defaultOptions, ...options };
        const notification = this.createNotification(message, type, config);
        
        this.container.appendChild(notification);
        this.notifications.push(notification);

        // Auto remove after specified duration
        if (config.autoClose && config.duration > 0) {
            setTimeout(() => {
                this.remove(notification);
            }, config.duration);
        }

        return notification;
    }

    createNotification(message, type, config) {
        const notification = document.createElement('div');
        const importantClass = config.important ? ' important' : '';
        notification.className = `notification-capsule notification-${type}${importantClass}`;

        // Create close button
        const closeButton = config.autoClose ? `
            <button class="notification-close" onclick="notificationSystem.remove(this.closest('.notification-capsule'))">
                <svg viewBox="0 0 24 24" fill="currentColor">
                    <path d="M18 6L6 18M6 6l12 12" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                </svg>
            </button>
        ` : '';

        notification.innerHTML = `
            <div class="flex items-center">
                <div class="notification-icon bg-white bg-opacity-20 rounded-full w-8 h-8 flex items-center justify-center mr-3">
                    ${this.getIcon(type)}
                </div>
                <div class="notification-content">
                    <p class="notification-message">${message}</p>
                    ${config.autoClose ? `<div class="notification-progress progress-line ${this.getProgressColor(type)}"></div>` : ''}
                </div>
            </div>
            ${closeButton}
        `;

        // Add click to close
        notification.addEventListener('click', (e) => {
            if (!e.target.closest('.notification-close')) {
                this.remove(notification);
            }
        });

        return notification;
    }

    remove(notification) {
        if (notification && notification.parentNode) {
            notification.classList.add('hide');
            setTimeout(() => {
                if (notification.parentNode) {
                    notification.remove();
                    this.notifications = this.notifications.filter(n => n !== notification);
                }
            }, 400);
        }
    }

    clearAll() {
        this.notifications.forEach(notification => {
            this.remove(notification);
        });
    }

    getCount() {
        return this.notifications.length;
    }

    getIcon(type) {
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

    getProgressColor(type) {
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
}

// Initialize notification system
const notificationSystem = new NotificationSystem();

// Global functions for backward compatibility and ease of use
window.showNotification = (message, type, options) => notificationSystem.show(message, type, options);
window.showSuccess = (msg, options) => notificationSystem.show(msg, 'success', options);
window.showError = (msg, options) => notificationSystem.show(msg, 'error', options);
window.showWarning = (msg, options) => notificationSystem.show(msg, 'warning', options);
window.showInfo = (msg, options) => notificationSystem.show(msg, 'info', options);
window.showCreate = (msg, options) => notificationSystem.show(msg, 'create', options);
window.showUpdate = (msg, options) => notificationSystem.show(msg, 'update', options);
window.showDelete = (msg, options) => notificationSystem.show(msg, 'delete', options);

// Special notification functions
window.showImportant = (msg, type = 'info') => notificationSystem.show(msg, type, { important: true, duration: 10000 });
window.showPersistent = (msg, type = 'info') => notificationSystem.show(msg, type, { autoClose: false, duration: 0 });
window.showQuick = (msg, type = 'info') => notificationSystem.show(msg, type, { duration: 2000 });

// Management functions
window.clearAllNotifications = () => notificationSystem.clearAll();
window.getNotificationCount = () => notificationSystem.getCount();

// Export for module usage
if (typeof module !== 'undefined' && module.exports) {
    module.exports = NotificationSystem;
}