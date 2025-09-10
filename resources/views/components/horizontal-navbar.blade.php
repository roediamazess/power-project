<!-- Horizontal Navigation Bar -->
<nav class="horizontal-navbar bg-white dark:bg-neutral-800 shadow-lg border-b border-neutral-200 dark:border-neutral-600">
    <div class="container mx-auto px-4">
        <div class="flex items-center justify-between h-16">
            
            <!-- Logo Section -->
            <div class="flex items-center">
                <a href="{{ route('index') }}" class="flex items-center space-x-2">
                    <img src="{{ asset('assets/images/company-logo.png') }}" alt="site logo" class="h-8 w-8">
                    <span class="text-xl font-bold text-neutral-900 dark:text-white">PowerPro</span>
                </a>
            </div>

            <!-- Main Navigation Menu -->
            <div class="hidden md:flex items-center space-x-1">
                <!-- Analytics Dashboard Dropdown -->
                <div class="relative group">
                    <button class="flex items-center space-x-1 px-3 py-2 text-sm font-medium text-neutral-700 dark:text-neutral-300 hover:text-primary-600 dark:hover:text-primary-400 hover:bg-neutral-100 dark:hover:bg-neutral-700 rounded-lg transition-colors">
                        <iconify-icon icon="solar:home-smile-angle-outline" class="text-lg"></iconify-icon>
                        <span>Analytics Dashboard</span>
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
                            <a href="{{ route('tableData') }}" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-300 hover:bg-neutral-100 dark:hover:bg-neutral-600">
                                <iconify-icon icon="heroicons:table-cells" class="text-lg"></iconify-icon>
                                <span>Tables</span>
                            </a>
                            <a href="{{ route('tableUsers') }}" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-300 hover:bg-neutral-100 dark:hover:bg-neutral-600">
                                <iconify-icon icon="heroicons:users" class="text-lg"></iconify-icon>
                                <span>Users</span>
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


                <!-- Layout: Display Name - Foto Avatar dengan Spacing Besar -->
                <div class="flex items-center">
                    <!-- Display Name -->
                    @if(session('user_id') && session('logged_in'))
                    <div class="flex items-center mr-16">
                        <span class="text-lg font-semibold text-neutral-900 dark:text-white">{{ session('user_name', 'User') }}</span>
                    </div>
                    @endif

                    <!-- Foto Avatar -->
                    @if(session('user_id') && session('logged_in'))
                    <button data-dropdown-toggle="dropdownProfile" class="flex justify-center items-center rounded-full hover:ring-2 hover:ring-primary-500 transition-all">
                        <img src="{{ asset('assets/images/users/komeng-avatar.png') }}" alt="User Avatar" class="w-12 h-12 rounded-full object-cover border-2 border-primary-200 dark:border-primary-700">
                    </button>
                    @else
                    <a href="{{ route('login') }}" class="flex items-center space-x-2 px-3 py-2 text-sm font-medium text-neutral-700 dark:text-neutral-300 hover:text-primary-600 dark:hover:text-primary-400 hover:bg-neutral-100 dark:hover:bg-neutral-700 rounded-lg transition-colors">
                        <iconify-icon icon="heroicons:user" class="text-lg"></iconify-icon>
                        <span>Login</span>
                    </a>
                    @endif
                </div>

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
                    Analytics Dashboard
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

<div id="dropdownProfile" class="z-10 hidden bg-white dark:bg-neutral-700 rounded-lg shadow-lg dropdown-menu-sm p-3 w-64">
    @if(session('user_id') && session('logged_in'))
    <div class="px-4 py-3 border-b border-neutral-200 dark:border-neutral-600">
        <div class="flex items-center space-x-3">
            <img src="{{ asset('assets/images/users/komeng-avatar.png') }}" alt="User Avatar" class="w-12 h-12 rounded-full object-cover border-2 border-primary-200 dark:border-primary-700">
            <div>
                <p class="text-sm font-semibold text-neutral-900 dark:text-white">{{ session('user_name', 'User') }}</p>
                <p class="text-xs text-neutral-500 dark:text-neutral-400">{{ session('user_email', 'user@example.com') }}</p>
                @if(session('user_role'))
                <span class="inline-block px-2 py-1 text-xs bg-green-100 dark:bg-green-900 text-green-600 dark:text-green-400 rounded-full mt-1">
                    {{ session('user_role') }}
                </span>
                @endif
            </div>
        </div>
    </div>
    <div class="py-1">
        <a href="{{ route('viewProfile') }}" class="flex items-center px-4 py-2 text-sm text-neutral-700 dark:text-neutral-300 hover:bg-neutral-100 dark:hover:bg-neutral-600">
            <iconify-icon icon="heroicons:user" class="mr-3 text-lg"></iconify-icon>
            My Profile
        </a>
        <div class="border-t border-neutral-200 dark:border-neutral-600 my-1"></div>
        <form method="POST" action="{{ route('logout') }}" class="block">
            @csrf
            <button type="submit" class="flex items-center w-full px-4 py-2 text-sm text-red-600 dark:text-red-400 hover:bg-red-50 dark:hover:bg-red-900/20">
                <iconify-icon icon="heroicons:arrow-right-on-rectangle" class="mr-3 text-lg"></iconify-icon>
                Log Out
            </button>
        </form>
    </div>
    @endif
</div>
