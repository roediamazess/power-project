<!-- Horizontal Navigation Bar -->
<nav class="horizontal-navbar bg-white dark:bg-neutral-800 shadow-lg border-b border-neutral-200 dark:border-neutral-600">
    <div class="container mx-auto px-4">
        <div class="flex items-center justify-between h-16">
            
            <!-- Logo Section -->
            <div class="flex items-center">
                <a href="{{ route('index') }}" class="flex items-center space-x-2">
                    <img src="{{ asset('assets/images/logo-icon.png') }}" alt="site logo" class="h-8 w-8">
                    <span class="text-xl font-bold text-neutral-900 dark:text-white">PowerPro</span>
                </a>
            </div>

            <!-- Main Navigation Menu -->
            <div class="hidden md:flex items-center space-x-1">
                <!-- Dashboard Dropdown -->
                <div class="relative group">
                    <button class="flex items-center space-x-1 px-3 py-2 text-sm font-medium text-neutral-700 dark:text-neutral-300 hover:text-primary-600 dark:hover:text-primary-400 hover:bg-neutral-100 dark:hover:bg-neutral-700 rounded-lg transition-colors">
                        <iconify-icon icon="solar:home-smile-angle-outline" class="text-lg"></iconify-icon>
                        <span>Dashboard</span>
                        <iconify-icon icon="heroicons:chevron-down" class="text-sm"></iconify-icon>
                    </button>
                    <div class="absolute top-full left-0 mt-1 w-64 bg-white dark:bg-neutral-700 rounded-lg shadow-lg border border-neutral-200 dark:border-neutral-600 opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-200 z-50">
                        <div class="py-2">
                            <a href="{{ route('index') }}" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-300 hover:bg-neutral-100 dark:hover:bg-neutral-600">
                                <i class="ri-circle-fill text-primary-600 text-xs"></i>
                                <span>AI Dashboard</span>
                            </a>
                            <a href="{{ route('index2') }}" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-300 hover:bg-neutral-100 dark:hover:bg-neutral-600">
                                <i class="ri-circle-fill text-warning-600 text-xs"></i>
                                <span>CRM Dashboard</span>
                            </a>
                            <a href="{{ route('index3') }}" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-300 hover:bg-neutral-100 dark:hover:bg-neutral-600">
                                <i class="ri-circle-fill text-info-600 text-xs"></i>
                                <span>eCommerce Dashboard</span>
                            </a>
                            <a href="{{ route('index4') }}" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-300 hover:bg-neutral-100 dark:hover:bg-neutral-600">
                                <i class="ri-circle-fill text-danger-600 text-xs"></i>
                                <span>Cryptocurrency Dashboard</span>
                            </a>
                            <a href="{{ route('index5') }}" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-300 hover:bg-neutral-100 dark:hover:bg-neutral-600">
                                <i class="ri-circle-fill text-success-600 text-xs"></i>
                                <span>Investment Dashboard</span>
                            </a>
                        </div>
                    </div>
                </div>

                <!-- Application Menu -->
                <div class="relative group">
                    <button class="flex items-center space-x-1 px-3 py-2 text-sm font-medium text-neutral-700 dark:text-neutral-300 hover:text-primary-600 dark:hover:text-primary-400 hover:bg-neutral-100 dark:hover:bg-neutral-700 rounded-lg transition-colors">
                        <iconify-icon icon="heroicons:squares-2x2" class="text-lg"></iconify-icon>
                        <span>Application</span>
                        <iconify-icon icon="heroicons:chevron-down" class="text-sm"></iconify-icon>
                    </button>
                    <div class="absolute top-full left-0 mt-1 w-56 bg-white dark:bg-neutral-700 rounded-lg shadow-lg border border-neutral-200 dark:border-neutral-600 opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-200 z-50">
                        <div class="py-2">
                            <a href="{{ route('email') }}" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-300 hover:bg-neutral-100 dark:hover:bg-neutral-600">
                                <iconify-icon icon="mage:email" class="text-lg"></iconify-icon>
                                <span>Email</span>
                            </a>
                            <a href="{{ route('chatMessage') }}" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-300 hover:bg-neutral-100 dark:hover:bg-neutral-600">
                                <iconify-icon icon="bi:chat-dots" class="text-lg"></iconify-icon>
                                <span>Chat</span>
                            </a>
                            <a href="{{ route('calendarMain') }}" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-300 hover:bg-neutral-100 dark:hover:bg-neutral-600">
                                <iconify-icon icon="solar:calendar-outline" class="text-lg"></iconify-icon>
                                <span>Calendar</span>
                            </a>
                            <a href="{{ route('kanban') }}" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-300 hover:bg-neutral-100 dark:hover:bg-neutral-600">
                                <iconify-icon icon="material-symbols:map-outline" class="text-lg"></iconify-icon>
                                <span>Kanban</span>
                            </a>
                        </div>
                    </div>
                </div>

                <!-- Components Menu -->
                <div class="relative group">
                    <button class="flex items-center space-x-1 px-3 py-2 text-sm font-medium text-neutral-700 dark:text-neutral-300 hover:text-primary-600 dark:hover:text-primary-400 hover:bg-neutral-100 dark:hover:bg-neutral-700 rounded-lg transition-colors">
                        <iconify-icon icon="heroicons:puzzle-piece" class="text-lg"></iconify-icon>
                        <span>Components</span>
                        <iconify-icon icon="heroicons:chevron-down" class="text-sm"></iconify-icon>
                    </button>
                    <div class="absolute top-full left-0 mt-1 w-64 bg-white dark:bg-neutral-700 rounded-lg shadow-lg border border-neutral-200 dark:border-neutral-600 opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-200 z-50">
                        <div class="py-2">
                            <a href="{{ route('button') }}" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-300 hover:bg-neutral-100 dark:hover:bg-neutral-600">
                                <iconify-icon icon="heroicons:command-line" class="text-lg"></iconify-icon>
                                <span>Buttons</span>
                            </a>
                            <a href="{{ route('card') }}" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-300 hover:bg-neutral-100 dark:hover:bg-neutral-600">
                                <iconify-icon icon="heroicons:rectangle-stack" class="text-lg"></iconify-icon>
                                <span>Cards</span>
                            </a>
                            <a href="{{ route('form') }}" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-300 hover:bg-neutral-100 dark:hover:bg-neutral-600">
                                <iconify-icon icon="heroicons:document-text" class="text-lg"></iconify-icon>
                                <span>Forms</span>
                            </a>
                            <a href="{{ route('tableBasic') }}" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-300 hover:bg-neutral-100 dark:hover:bg-neutral-600">
                                <iconify-icon icon="heroicons:table-cells" class="text-lg"></iconify-icon>
                                <span>Tables</span>
                            </a>
                        </div>
                    </div>
                </div>

                <!-- Direct Links -->
                <a href="{{ route('gallery') }}" class="flex items-center space-x-1 px-3 py-2 text-sm font-medium text-neutral-700 dark:text-neutral-300 hover:text-primary-600 dark:hover:text-primary-400 hover:bg-neutral-100 dark:hover:bg-neutral-700 rounded-lg transition-colors">
                    <iconify-icon icon="heroicons:photo" class="text-lg"></iconify-icon>
                    <span>Gallery</span>
                </a>
                
                <a href="{{ route('pricing') }}" class="flex items-center space-x-1 px-3 py-2 text-sm font-medium text-neutral-700 dark:text-neutral-300 hover:text-primary-600 dark:hover:text-primary-400 hover:bg-neutral-100 dark:hover:bg-neutral-700 rounded-lg transition-colors">
                    <iconify-icon icon="heroicons:currency-dollar" class="text-lg"></iconify-icon>
                    <span>Pricing</span>
                </a>
            </div>

            <!-- Right Side Actions -->
            <div class="flex items-center space-x-3">
                <!-- Layout Toggle -->
                <div class="flex items-center space-x-2 bg-neutral-100 dark:bg-neutral-700 rounded-lg p-1">
                    <button type="button" id="layout-toggle" class="flex items-center space-x-1 px-3 py-1.5 text-sm font-medium rounded-md transition-all duration-200" data-layout="horizontal">
                        <iconify-icon icon="heroicons:bars-3" class="text-lg"></iconify-icon>
                        <span class="hidden sm:inline">Horizontal</span>
                    </button>
                    <button type="button" id="sidebar-toggle" class="flex items-center space-x-1 px-3 py-1.5 text-sm font-medium rounded-md transition-all duration-200" data-layout="sidebar">
                        <iconify-icon icon="heroicons:bars-3-bottom-left" class="text-lg"></iconify-icon>
                        <span class="hidden sm:inline">Sidebar</span>
                    </button>
                </div>

                <!-- Search -->
                <div class="hidden sm:block">
                    <form class="relative">
                        <input type="text" placeholder="Search..." class="w-64 px-4 py-2 pl-10 text-sm border border-neutral-300 dark:border-neutral-600 rounded-lg bg-white dark:bg-neutral-700 text-neutral-900 dark:text-white focus:ring-2 focus:ring-primary-500 focus:border-transparent">
                        <iconify-icon icon="ion:search-outline" class="absolute left-3 top-1/2 transform -translate-y-1/2 text-neutral-400 text-lg"></iconify-icon>
                    </form>
                </div>

                <!-- Theme Toggle -->
                <button type="button" id="theme-toggle" class="w-10 h-10 bg-neutral-200 dark:bg-neutral-700 dark:text-white rounded-full flex justify-center items-center hover:bg-neutral-300 dark:hover:bg-neutral-600 transition-colors">
                    <span id="theme-toggle-dark-icon" class="hidden">
                        <i class="ri-sun-line"></i>
                    </span>
                    <span id="theme-toggle-light-icon" class="hidden">
                        <i class="ri-moon-line"></i>
                    </span>
                </button>

                <!-- Notifications -->
                <button data-dropdown-toggle="dropdownNotification" class="relative w-10 h-10 bg-neutral-200 dark:bg-neutral-700 rounded-full flex justify-center items-center hover:bg-neutral-300 dark:hover:bg-neutral-600 transition-colors">
                    <iconify-icon icon="iconoir:bell" class="text-neutral-900 dark:text-white text-xl"></iconify-icon>
                    <span class="absolute -top-1 -right-1 w-5 h-5 bg-red-500 text-white text-xs rounded-full flex items-center justify-center">5</span>
                </button>

                <!-- Messages -->
                <button data-dropdown-toggle="dropdownMessage" class="relative w-10 h-10 bg-neutral-200 dark:bg-neutral-700 rounded-full flex justify-center items-center hover:bg-neutral-300 dark:hover:bg-neutral-600 transition-colors">
                    <iconify-icon icon="mage:email" class="text-neutral-900 dark:text-white text-xl"></iconify-icon>
                    <span class="absolute -top-1 -right-1 w-5 h-5 bg-blue-500 text-white text-xs rounded-full flex items-center justify-center">3</span>
                </button>

                <!-- Profile -->
                <button data-dropdown-toggle="dropdownProfile" class="flex justify-center items-center rounded-full hover:ring-2 hover:ring-primary-500 transition-all">
                    <img src="{{ asset('assets/images/user.png') }}" alt="profile" class="w-10 h-10 object-cover rounded-full">
                </button>

                <!-- Mobile Menu Button -->
                <button type="button" class="md:hidden w-10 h-10 bg-neutral-200 dark:bg-neutral-700 rounded-lg flex justify-center items-center hover:bg-neutral-300 dark:hover:bg-neutral-600 transition-colors" id="mobile-menu-button">
                    <iconify-icon icon="heroicons:bars-3" class="text-neutral-900 dark:text-white text-xl"></iconify-icon>
                </button>
            </div>
        </div>

        <!-- Mobile Menu -->
        <div class="md:hidden hidden" id="mobile-menu">
            <div class="px-2 pt-2 pb-3 space-y-1 bg-white dark:bg-neutral-800 border-t border-neutral-200 dark:border-neutral-600">
                <a href="{{ route('index') }}" class="block px-3 py-2 text-base font-medium text-neutral-700 dark:text-neutral-300 hover:text-primary-600 dark:hover:text-primary-400 hover:bg-neutral-100 dark:hover:bg-neutral-700 rounded-lg">
                    <iconify-icon icon="solar:home-smile-angle-outline" class="inline mr-2"></iconify-icon>
                    Dashboard
                </a>
                <a href="{{ route('email') }}" class="block px-3 py-2 text-base font-medium text-neutral-700 dark:text-neutral-300 hover:text-primary-600 dark:hover:text-primary-400 hover:bg-neutral-100 dark:hover:bg-neutral-700 rounded-lg">
                    <iconify-icon icon="mage:email" class="inline mr-2"></iconify-icon>
                    Email
                </a>
                <a href="{{ route('chatMessage') }}" class="block px-3 py-2 text-base font-medium text-neutral-700 dark:text-neutral-300 hover:text-primary-600 dark:hover:text-primary-400 hover:bg-neutral-100 dark:hover:bg-neutral-700 rounded-lg">
                    <iconify-icon icon="bi:chat-dots" class="inline mr-2"></iconify-icon>
                    Chat
                </a>
                <a href="{{ route('gallery') }}" class="block px-3 py-2 text-base font-medium text-neutral-700 dark:text-neutral-300 hover:text-primary-600 dark:hover:text-primary-400 hover:bg-neutral-100 dark:hover:bg-neutral-700 rounded-lg">
                    <iconify-icon icon="heroicons:photo" class="inline mr-2"></iconify-icon>
                    Gallery
                </a>
            </div>
        </div>
    </div>
</nav>

<!-- Include the existing dropdown menus from navbar.blade.php -->
<div id="dropdownNotification" class="z-10 hidden bg-white dark:bg-neutral-700 rounded-2xl overflow-hidden shadow-lg max-w-[394px] w-full">
    <!-- Notification content from original navbar -->
</div>

<div id="dropdownMessage" class="z-10 hidden bg-white dark:bg-neutral-700 rounded-2xl overflow-hidden shadow-lg max-w-[394px] w-full">
    <!-- Message content from original navbar -->
</div>

<div id="dropdownProfile" class="z-10 hidden bg-white dark:bg-neutral-700 rounded-lg shadow-lg dropdown-menu-sm p-3">
    <!-- Profile content from original navbar -->
</div>
