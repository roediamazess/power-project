// Horizontal Navbar JavaScript
document.addEventListener('DOMContentLoaded', function() {
    
    // Mobile menu toggle
    const mobileMenuButton = document.getElementById('mobile-menu-button');
    const mobileMenu = document.getElementById('mobile-menu');
    
    if (mobileMenuButton && mobileMenu) {
        mobileMenuButton.addEventListener('click', function() {
            mobileMenu.classList.toggle('hidden');
            mobileMenu.classList.toggle('show');
        });
    }
    
    // Close mobile menu when clicking outside
    document.addEventListener('click', function(event) {
        if (mobileMenu && !mobileMenuButton.contains(event.target) && !mobileMenu.contains(event.target)) {
            mobileMenu.classList.add('hidden');
            mobileMenu.classList.remove('show');
        }
    });
    
    // Dropdown menu functionality
    const dropdownButtons = document.querySelectorAll('[data-dropdown-toggle]');
    
    dropdownButtons.forEach(button => {
        const dropdownId = button.getAttribute('data-dropdown-toggle');
        const dropdown = document.getElementById(dropdownId);
        
        if (dropdown) {
            button.addEventListener('click', function(e) {
                e.preventDefault();
                e.stopPropagation();
                
                // Close other dropdowns
                dropdownButtons.forEach(otherButton => {
                    if (otherButton !== button) {
                        const otherDropdownId = otherButton.getAttribute('data-dropdown-toggle');
                        const otherDropdown = document.getElementById(otherDropdownId);
                        if (otherDropdown) {
                            otherDropdown.classList.add('hidden');
                        }
                    }
                });
                
                // Toggle current dropdown
                dropdown.classList.toggle('hidden');
            });
        }
    });
    
    // Close dropdowns when clicking outside
    document.addEventListener('click', function(event) {
        dropdownButtons.forEach(button => {
            const dropdownId = button.getAttribute('data-dropdown-toggle');
            const dropdown = document.getElementById(dropdownId);
            
            if (dropdown && !button.contains(event.target) && !dropdown.contains(event.target)) {
                dropdown.classList.add('hidden');
            }
        });
    });
    
    // Theme toggle functionality
    const themeToggle = document.getElementById('theme-toggle');
    if (themeToggle) {
        themeToggle.addEventListener('click', function() {
            const html = document.documentElement;
            const isDark = html.classList.contains('dark');
            
            if (isDark) {
                html.classList.remove('dark');
                localStorage.setItem('theme', 'light');
            } else {
                html.classList.add('dark');
                localStorage.setItem('theme', 'dark');
            }
        });
    }
    
    // Initialize theme from localStorage
    const savedTheme = localStorage.getItem('theme');
    if (savedTheme) {
        if (savedTheme === 'dark') {
            document.documentElement.classList.add('dark');
        } else {
            document.documentElement.classList.remove('dark');
        }
    }
    
    // Smooth scrolling for anchor links
    const anchorLinks = document.querySelectorAll('a[href^="#"]');
    anchorLinks.forEach(link => {
        link.addEventListener('click', function(e) {
            e.preventDefault();
            const targetId = this.getAttribute('href').substring(1);
            const targetElement = document.getElementById(targetId);
            
            if (targetElement) {
                targetElement.scrollIntoView({
                    behavior: 'smooth',
                    block: 'start'
                });
            }
        });
    });
    
    // Search functionality
    const searchInput = document.querySelector('.horizontal-navbar input[type="text"]');
    if (searchInput) {
        searchInput.addEventListener('keypress', function(e) {
            if (e.key === 'Enter') {
                e.preventDefault();
                const searchTerm = this.value.trim();
                if (searchTerm) {
                    // Implement search functionality here
                    console.log('Searching for:', searchTerm);
                    // You can redirect to search results page or filter content
                }
            }
        });
    }
    
    // Add loading state to dropdowns
    const dropdownMenus = document.querySelectorAll('.horizontal-navbar .dropdown-menu');
    dropdownMenus.forEach(menu => {
        const parentButton = document.querySelector(`[data-dropdown-toggle="${menu.id}"]`);
        if (parentButton) {
            parentButton.addEventListener('click', function() {
                menu.classList.add('loading');
                setTimeout(() => {
                    menu.classList.remove('loading');
                }, 300);
            });
        }
    });
    
    // Add hover effects for better UX
    const menuItems = document.querySelectorAll('.horizontal-navbar .flex.items-center.space-x-1');
    menuItems.forEach(item => {
        item.addEventListener('mouseenter', function() {
            this.style.transform = 'translateY(-1px)';
        });
        
        item.addEventListener('mouseleave', function() {
            this.style.transform = 'translateY(0)';
        });
    });
    
    // Notification badge animation
    const notificationBadges = document.querySelectorAll('.horizontal-navbar .relative span');
    notificationBadges.forEach(badge => {
        badge.addEventListener('click', function() {
            this.style.animation = 'none';
            setTimeout(() => {
                this.style.animation = 'pulse 2s infinite';
            }, 100);
        });
    });
    
    // Keyboard navigation support
    document.addEventListener('keydown', function(e) {
        if (e.key === 'Escape') {
            // Close all dropdowns
            dropdownButtons.forEach(button => {
                const dropdownId = button.getAttribute('data-dropdown-toggle');
                const dropdown = document.getElementById(dropdownId);
                if (dropdown) {
                    dropdown.classList.add('hidden');
                }
            });
            
            // Close mobile menu
            if (mobileMenu) {
                mobileMenu.classList.add('hidden');
                mobileMenu.classList.remove('show');
            }
        }
    });
    
    // Resize handler for responsive behavior
    window.addEventListener('resize', function() {
        if (window.innerWidth > 768) {
            // Close mobile menu on desktop
            if (mobileMenu) {
                mobileMenu.classList.add('hidden');
                mobileMenu.classList.remove('show');
            }
        }
    });
    
    // Add active state to current page menu item
    const currentPath = window.location.pathname;
    const menuLinks = document.querySelectorAll('.horizontal-navbar a[href]');
    menuLinks.forEach(link => {
        if (link.getAttribute('href') === currentPath) {
            link.classList.add('text-primary-600', 'bg-primary-50', 'dark:bg-primary-600/25');
        }
    });
    
    // Layout switching functionality
    const layoutToggle = document.getElementById('layout-toggle');
    const sidebarToggle = document.getElementById('sidebar-toggle');
    
    if (layoutToggle && sidebarToggle) {
        // Set initial active state
        updateLayoutToggleState();
        
        layoutToggle.addEventListener('click', function() {
            switchLayout('horizontal');
        });
        
        sidebarToggle.addEventListener('click', function() {
            switchLayout('sidebar');
        });
    }
    
    function switchLayout(layout) {
        // Show loading state
        const buttons = [layoutToggle, sidebarToggle];
        buttons.forEach(btn => {
            if (btn) {
                btn.disabled = true;
                btn.classList.add('opacity-50', 'cursor-not-allowed');
            }
        });
        
        // Send request to switch layout
        fetch('/switch-layout', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]')?.getAttribute('content') || ''
            },
            body: JSON.stringify({ layout: layout })
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                // Reload page to apply new layout
                window.location.reload();
            } else {
                console.error('Failed to switch layout:', data.error);
                showNotification('Failed to switch layout', 'error');
            }
        })
        .catch(error => {
            console.error('Error switching layout:', error);
            showNotification('Error switching layout', 'error');
        })
        .finally(() => {
            // Remove loading state
            buttons.forEach(btn => {
                if (btn) {
                    btn.disabled = false;
                    btn.classList.remove('opacity-50', 'cursor-not-allowed');
                }
            });
        });
    }
    
    function updateLayoutToggleState() {
        // Get current layout from session or default to horizontal
        fetch('/get-layout')
        .then(response => response.json())
        .then(data => {
            const currentLayout = data.layout || 'horizontal';
            
            if (currentLayout === 'horizontal') {
                layoutToggle?.classList.add('bg-primary-600', 'text-white');
                layoutToggle?.classList.remove('text-neutral-700', 'dark:text-neutral-300');
                sidebarToggle?.classList.remove('bg-primary-600', 'text-white');
                sidebarToggle?.classList.add('text-neutral-700', 'dark:text-neutral-300');
            } else {
                sidebarToggle?.classList.add('bg-primary-600', 'text-white');
                sidebarToggle?.classList.remove('text-neutral-700', 'dark:text-neutral-300');
                layoutToggle?.classList.remove('bg-primary-600', 'text-white');
                layoutToggle?.classList.add('text-neutral-700', 'dark:text-neutral-300');
            }
        })
        .catch(error => {
            console.error('Error getting layout:', error);
            // Default to horizontal layout
            layoutToggle?.classList.add('bg-primary-600', 'text-white');
        });
    }
    
    function showNotification(message, type = 'info') {
        // Create notification element
        const notification = document.createElement('div');
        notification.className = `fixed top-4 right-4 z-50 px-4 py-2 rounded-lg text-white ${
            type === 'error' ? 'bg-red-500' : 'bg-blue-500'
        }`;
        notification.textContent = message;
        
        document.body.appendChild(notification);
        
        // Remove notification after 3 seconds
        setTimeout(() => {
            notification.remove();
        }, 3000);
    }
    
    console.log('Horizontal Navbar initialized successfully!');
});
