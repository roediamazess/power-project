<!-- Floating Capsule Navigation Bar -->
<nav class="fixed top-4 left-1/2 transform -translate-x-1/2 z-50">
    <div class="bg-white/90 dark:bg-neutral-800/90 backdrop-blur-md border border-neutral-200/50 dark:border-neutral-700/50 rounded-full shadow-lg shadow-neutral-200/20 dark:shadow-neutral-900/20 px-4 py-2">
        <div class="flex items-center justify-between w-full">
            
            <!-- Logo Section (Left) -->
            <div class="flex items-center space-x-3">
                <a href="{{ route('index') }}" class="flex items-center space-x-2">
                    <div class="relative">
                        <img src="{{ asset('assets/images/company-logo.png') }}" alt="Power Project Logo" class="h-8 w-8 rounded-full object-cover rotating-logo">
                        <div class="absolute inset-0 rounded-full bg-gradient-to-r from-primary-500/20 to-secondary-500/20 animate-pulse"></div>
                    </div>
                    <span class="text-lg font-bold text-neutral-900 dark:text-white hidden sm:block">Power Project</span>
                </a>
            </div>

            <!-- Navigation Menu (Center) -->
            <div class="menu-desktop flex items-center space-x-1 ml-8">
                <!-- Analytics Dashboard Dropdown -->
                <div class="relative dropdown-group">
                    <button onclick="toggleDropdown('analytics-dropdown')" class="nav-link flex items-center space-x-2 px-3 py-2 rounded-md text-sm font-medium text-neutral-700 dark:text-neutral-200 hover:text-primary-600 dark:hover:text-primary-400 hover:bg-neutral-100 dark:hover:bg-neutral-700 transition-colors duration-150">
                        <iconify-icon icon="solar:home-smile-angle-outline" class="text-lg"></iconify-icon>
                        <span>Analytics</span>
                        <iconify-icon icon="heroicons:chevron-down-20-solid" class="text-xs dropdown-arrow"></iconify-icon>
                    </button>
                    <div id="analytics-dropdown" class="absolute left-0 mt-2 w-56 bg-white dark:bg-neutral-800 rounded-md shadow-lg opacity-0 invisible transition-all duration-200 z-50 border border-neutral-200 dark:border-neutral-700 dropdown-menu">
                        <div class="py-1">
                            <a href="{{ route('index') }}" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-200 hover:bg-neutral-100 dark:hover:bg-neutral-700">
                                <i class="ri-circle-fill text-primary-600"></i>
                                <span>AI Dashboard</span>
                            </a>
                            <a href="{{ route('index2') }}" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-200 hover:bg-neutral-100 dark:hover:bg-neutral-700">
                                <i class="ri-circle-fill text-warning-600"></i>
                                <span>CRM Dashboard</span>
                            </a>
                            <a href="{{ route('index3') }}" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-200 hover:bg-neutral-100 dark:hover:bg-neutral-700">
                                <i class="ri-circle-fill text-info-600"></i>
                                <span>eCommerce Dashboard</span>
                            </a>
                            <a href="{{ route('index4') }}" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-200 hover:bg-neutral-100 dark:hover:bg-neutral-700">
                                <i class="ri-circle-fill text-danger-600"></i>
                                <span>Cryptocurrency Dashboard</span>
                            </a>
                            <a href="{{ route('index5') }}" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-200 hover:bg-neutral-100 dark:hover:bg-neutral-700">
                                <i class="ri-circle-fill text-success-600"></i>
                                <span>Project Dashboard</span>
                            </a>
                            <a href="{{ route('index6') }}" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-200 hover:bg-neutral-100 dark:hover:bg-neutral-700">
                                <i class="ri-circle-fill text-purple-600"></i>
                                <span>Analytics Overview</span>
                            </a>
                            <a href="{{ route('index7') }}" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-200 hover:bg-neutral-100 dark:hover:bg-neutral-700">
                                <i class="ri-circle-fill text-indigo-600"></i>
                                <span>Sales Analytics</span>
                            </a>
                            <a href="{{ route('index8') }}" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-200 hover:bg-neutral-100 dark:hover:bg-neutral-700">
                                <i class="ri-circle-fill text-pink-600"></i>
                                <span>Marketing Dashboard</span>
                            </a>
                        </div>
                    </div>
                </div>

                <!-- Application Menu Items -->
                <a href="{{ route('activity') }}" class="nav-link flex items-center space-x-2 px-3 py-2 rounded-md text-sm font-medium text-neutral-700 dark:text-neutral-200 hover:text-primary-600 dark:hover:text-primary-400 hover:bg-neutral-100 dark:hover:bg-neutral-700 transition-colors duration-150">
                    <i class="ri-list-check text-primary-600 text-base"></i>
                    <iconify-icon icon="solar:activity-outline" class="text-lg"></iconify-icon>
                    <span>Activity</span>
                </a>
                

                <!-- Time Boxing link -->
                <a href="{{ route('timeboxing.index') }}" class="nav-link flex items-center space-x-2 px-3 py-2 rounded-md text-sm font-medium text-neutral-700 dark:text-neutral-200 hover:text-primary-600 dark:hover:text-primary-400 hover:bg-neutral-100 dark:hover:bg-neutral-700 transition-colors duration-150">
                    <iconify-icon icon="solar:timer-outline" class="text-lg"></iconify-icon>
                    <span>Time Boxing</span>
                </a>

                <!-- Notification Demo link -->
                <a href="{{ route('demo.notifications') }}" class="nav-link flex items-center space-x-2 px-3 py-2 rounded-md text-sm font-medium text-neutral-700 dark:text-neutral-200 hover:text-primary-600 dark:hover:text-primary-400 hover:bg-neutral-100 dark:hover:bg-neutral-700 transition-colors duration-150">
                    <iconify-icon icon="solar:notification-unread-outline" class="text-lg"></iconify-icon>
                    <span>Notifications</span>
                </a>


                <!-- Components Dropdown (from Sidebar) -->
                <div class="relative dropdown-group">
                    <button onclick="toggleDropdown('components-dropdown')" class="nav-link flex items-center space-x-2 px-3 py-2 rounded-md text-sm font-medium text-neutral-700 dark:text-neutral-200 hover:text-primary-600 dark:hover:text-primary-400 hover:bg-neutral-100 dark:hover:bg-neutral-700 transition-colors duration-150">
                        <iconify-icon icon="solar:document-text-outline" class="text-lg"></iconify-icon>
                        <span>Components</span>
                        <iconify-icon icon="heroicons:chevron-down-20-solid" class="text-xs dropdown-arrow"></iconify-icon>
                    </button>
                    <div id="components-dropdown" class="absolute left-0 mt-2 w-56 bg-white dark:bg-neutral-800 rounded-md shadow-lg opacity-0 invisible transition-all duration-200 z-50 border border-neutral-200 dark:border-neutral-700 dropdown-menu">
                        <div class="py-1 overflow-y-auto max-h-80">
                            <a href="{{ route('typography') }}" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-200 hover:bg-neutral-100 dark:hover:bg-neutral-700"><span>Typography</span></a>
                            <a href="{{ route('colors') }}" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-200 hover:bg-neutral-100 dark:hover:bg-neutral-700"><span>Colors</span></a>
                            <a href="{{ route('button') }}" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-200 hover:bg-neutral-100 dark:hover:bg-neutral-700"><span>Button</span></a>
                            <a href="{{ route('dropdown') }}" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-200 hover:bg-neutral-100 dark:hover:bg-neutral-700"><span>Dropdown</span></a>
                            <a href="{{ route('alert') }}" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-200 hover:bg-neutral-100 dark:hover:bg-neutral-700"><span>Alerts</span></a>
                            <a href="{{ route('card') }}" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-200 hover:bg-neutral-100 dark:hover:bg-neutral-700"><span>Card</span></a>
                            <a href="{{ route('carousel') }}" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-200 hover:bg-neutral-100 dark:hover:bg-neutral-700"><span>Carousel</span></a>
                            <a href="{{ route('avatar') }}" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-200 hover:bg-neutral-100 dark:hover:bg-neutral-700"><span>Avatars</span></a>
                            <a href="{{ route('progress') }}" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-200 hover:bg-neutral-100 dark:hover:bg-neutral-700"><span>Progress bar</span></a>
                            <a href="{{ route('tabs') }}" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-200 hover:bg-neutral-100 dark:hover:bg-neutral-700"><span>Tab & Accordion</span></a>
                            <a href="{{ route('pagination') }}" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-200 hover:bg-neutral-100 dark:hover:bg-neutral-700"><span>Pagination</span></a>
                            <a href="{{ route('badges') }}" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-200 hover:bg-neutral-100 dark:hover:bg-neutral-700"><span>Badges</span></a>
                            <a href="{{ route('tooltip') }}" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-200 hover:bg-neutral-100 dark:hover:bg-neutral-700"><span>Tooltip & Popover</span></a>
                            <a href="{{ route('videos') }}" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-200 hover:bg-neutral-100 dark:hover:bg-neutral-700"><span>Videos</span></a>
                            <a href="{{ route('starRating') }}" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-200 hover:bg-neutral-100 dark:hover:bg-neutral-700"><span>Star Ratings</span></a>
                            <a href="{{ route('tags') }}" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-200 hover:bg-neutral-100 dark:hover:bg-neutral-700"><span>Tags</span></a>
                            <a href="{{ route('list') }}" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-200 hover:bg-neutral-100 dark:hover:bg-neutral-700"><span>List</span></a>
                            <a href="{{ route('calendar') }}" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-200 hover:bg-neutral-100 dark:hover:bg-neutral-700"><span>Calendar</span></a>
                            <a href="{{ route('radio') }}" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-200 hover:bg-neutral-100 dark:hover:bg-neutral-700"><span>Radio</span></a>
                            <a href="{{ route('switch') }}" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-200 hover:bg-neutral-100 dark:hover:bg-neutral-700"><span>Switch</span></a>
                            <a href="{{ route('imageUpload') }}" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-200 hover:bg-neutral-100 dark:hover:bg-neutral-700"><span>Upload</span></a>
                        </div>
                    </div>
                </div>


                <!-- Tables Dropdown -->
                <div class="relative dropdown-group">
                    <button onclick="toggleDropdown('tables-dropdown')" class="nav-link flex items-center space-x-2 px-3 py-2 rounded-md text-sm font-medium text-neutral-700 dark:text-neutral-200 hover:text-primary-600 dark:hover:text-primary-400 hover:bg-neutral-100 dark:hover:bg-neutral-700 transition-colors duration-150">
                        <iconify-icon icon="mingcute:storage-line" class="text-lg"></iconify-icon>
                        <span>Tables</span>
                        <iconify-icon icon="heroicons:chevron-down-20-solid" class="text-xs dropdown-arrow"></iconify-icon>
                    </button>
                    <div id="tables-dropdown" class="absolute left-0 mt-2 w-56 bg-white dark:bg-neutral-800 rounded-md shadow-lg opacity-0 invisible transition-all duration-200 z-50 border border-neutral-200 dark:border-neutral-700 dropdown-menu">
                        <div class="py-1">
                            <a href="{{ route('tableData') }}" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-200 hover:bg-neutral-100 dark:hover:bg-neutral-700"><span>Data Table</span></a>
                            <a href="{{ route('tableUsers') }}" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-200 hover:bg-neutral-100 dark:hover:bg-neutral-700"><span>Users</span></a>
                        </div>
                    </div>
                </div>

                <!-- Chart Dropdown -->
                <div class="relative dropdown-group">
                    <button onclick="toggleDropdown('chart-dropdown')" class="nav-link flex items-center space-x-2 px-3 py-2 rounded-md text-sm font-medium text-neutral-700 dark:text-neutral-200 hover:text-primary-600 dark:hover:text-primary-400 hover:bg-neutral-100 dark:hover:bg-neutral-700 transition-colors duration-150">
                        <iconify-icon icon="solar:pie-chart-outline" class="text-lg"></iconify-icon>
                        <span>Chart</span>
                        <iconify-icon icon="heroicons:chevron-down-20-solid" class="text-xs dropdown-arrow"></iconify-icon>
                    </button>
                    <div id="chart-dropdown" class="absolute left-0 mt-2 w-56 bg-white dark:bg-neutral-800 rounded-md shadow-lg opacity-0 invisible transition-all duration-200 z-50 border border-neutral-200 dark:border-neutral-700 dropdown-menu">
                        <div class="py-1">
                            <a href="{{ route('lineChart') }}" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-200 hover:bg-neutral-100 dark:hover:bg-neutral-700"><span>Line Chart</span></a>
                            <a href="{{ route('columnChart') }}" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-200 hover:bg-neutral-100 dark:hover:bg-neutral-700"><span>Column Chart</span></a>
                            <a href="{{ route('pieChart') }}" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-200 hover:bg-neutral-100 dark:hover:bg-neutral-700"><span>Pie Chart</span></a>
                        </div>
                    </div>
                </div>

                <!-- Widgets link -->
                <a href="{{ route('widgets') }}" class="nav-link flex items-center space-x-2 px-3 py-2 rounded-md text-sm font-medium text-neutral-700 dark:text-neutral-200 hover:text-primary-600 dark:hover:text-primary-400 hover:bg-neutral-100 dark:hover:bg-neutral-700 transition-colors duration-150">
                    <iconify-icon icon="fe:vector" class="text-lg"></iconify-icon>
                    <span>Widgets</span>
                </a>

            </div>

            <!-- User Profile Section (Right) -->
            <div class="flex items-center space-x-3">
                <div class="relative dropdown-group">
                    <button onclick="toggleDropdown('user-dropdown')" class="nav-link flex items-center px-2 py-2 rounded-full text-sm font-medium text-neutral-700 dark:text-neutral-200 hover:text-primary-600 dark:hover:text-primary-400 hover:bg-neutral-100 dark:hover:bg-neutral-700 transition-colors duration-150">
                        <div class="relative">
                            <img src="{{ asset(session('user_avatar', 'assets/images/default-avatar.png')) }}" alt="User Avatar" class="h-8 w-8 rounded-full object-cover border-2 border-primary-500/20">
                            <div class="absolute -bottom-1 -right-1 w-3 h-3 bg-green-500 rounded-full border-2 border-white dark:border-neutral-800"></div>
                        </div>
                    </button>
                    <div id="user-dropdown" class="absolute right-0 mt-2 w-64 bg-white dark:bg-neutral-800 rounded-xl shadow-lg opacity-0 invisible transition-all duration-200 z-50 border border-neutral-200 dark:border-neutral-700 dropdown-menu">
                        <div class="py-2">
                            <!-- User Info Header -->
                            <div class="px-4 py-3 border-b border-neutral-200 dark:border-neutral-700">
                                <div class="flex items-center space-x-3">
                                    <img src="{{ asset(session('user_avatar', 'assets/images/default-avatar.png')) }}" alt="User Avatar" class="h-12 w-12 rounded-full object-cover border-2 border-primary-500/20">
                                    <div>
                                        <p class="text-sm font-medium text-neutral-900 dark:text-white">{{ session('user_name', 'User') }}</p>
                                        <p class="text-xs text-neutral-500 dark:text-neutral-400">{{ session('user_email', 'user@example.com') }}</p>
                                        <p class="text-xs text-primary-600 dark:text-primary-400 font-medium">{{ session('user_role', 'User') }}</p>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Menu Items -->
                            <div class="py-1">
                                <a href="{{ route('viewProfile') }}" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-200 hover:bg-neutral-100 dark:hover:bg-neutral-700 transition-colors duration-150">
                                    <iconify-icon icon="solar:user-linear" class="text-lg text-primary-600"></iconify-icon>
                                    <span>My Profile</span>
                                </a>
                                <a href="#" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-200 hover:bg-neutral-100 dark:hover:bg-neutral-700 transition-colors duration-150">
                                    <iconify-icon icon="solar:settings-linear" class="text-lg text-neutral-600"></iconify-icon>
                                    <span>Settings</span>
                                </a>
                                <a href="#" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-200 hover:bg-neutral-100 dark:hover:bg-neutral-700 transition-colors duration-150">
                                    <iconify-icon icon="solar:bell-linear" class="text-lg text-warning-600"></iconify-icon>
                                    <span>Notifications</span>
                                </a>
                                <div class="border-t border-neutral-200 dark:border-neutral-700 my-1"></div>
                                <form method="POST" action="{{ route('logout') }}">
                                    @csrf
                                    <button type="submit" class="w-full text-left flex items-center space-x-3 px-4 py-2 text-sm text-red-600 dark:text-red-400 hover:bg-red-50 dark:hover:bg-red-900/20 transition-colors duration-150">
                                        <iconify-icon icon="lucide:power" class="text-lg"></iconify-icon>
                                        <span>Log Out</span>
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</nav>

<script>
function toggleDropdown(dropdownId) {
    // Close all other dropdowns
    const allDropdowns = document.querySelectorAll('.dropdown-menu');
    allDropdowns.forEach(dropdown => {
        if (dropdown.id !== dropdownId) {
            dropdown.classList.add('opacity-0', 'invisible');
            dropdown.classList.remove('opacity-100', 'visible');
        }
    });
    
    // Toggle the clicked dropdown
    const dropdown = document.getElementById(dropdownId);
    if (dropdown) {
        dropdown.classList.toggle('opacity-0');
        dropdown.classList.toggle('invisible');
        dropdown.classList.toggle('opacity-100');
        dropdown.classList.toggle('visible');
        
        // Rotate arrow
        const arrow = dropdown.previousElementSibling.querySelector('.dropdown-arrow');
        if (arrow) {
            arrow.style.transform = dropdown.classList.contains('opacity-100') ? 'rotate(180deg)' : 'rotate(0deg)';
        }
    }
}

// Close dropdowns when clicking outside
document.addEventListener('click', function(event) {
    const dropdownGroups = document.querySelectorAll('.dropdown-group');
    dropdownGroups.forEach(group => {
        if (!group.contains(event.target)) {
            const dropdown = group.querySelector('.dropdown-menu');
            if (dropdown) {
                dropdown.classList.add('opacity-0', 'invisible');
                dropdown.classList.remove('opacity-100', 'visible');
                
                // Reset arrow rotation
                const arrow = group.querySelector('.dropdown-arrow');
                if (arrow) {
                    arrow.style.transform = 'rotate(0deg)';
                }
            }
        }
    });
});
</script>

<style>
/* Rotating Logo Animation */
.rotating-logo {
    animation: rotate 3s linear infinite;
    transition: transform 0.3s ease;
}

.rotating-logo:hover {
    animation-play-state: paused;
    transform: scale(1.1);
}

@keyframes rotate {
    from {
        transform: rotate(0deg);
    }
    to {
        transform: rotate(360deg);
    }
}

/* Smooth transitions for dropdown arrows */
.dropdown-arrow {
    transition: transform 0.3s ease;
}

/* User profile hover effects */
.nav-link:hover .rotating-logo {
    animation-play-state: paused;
}

/* Online status indicator */
.bg-green-500 {
    animation: pulse-green 2s infinite;
}

@keyframes pulse-green {
    0%, 100% {
        opacity: 1;
    }
    50% {
        opacity: 0.7;
    }
}
</style>