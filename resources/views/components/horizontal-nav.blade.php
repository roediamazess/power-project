<!-- Horizontal Navigation Bar -->
<nav class="horizontal-navbar bg-white dark:bg-neutral-800 border-b border-neutral-200 dark:border-neutral-700 shadow-sm">
    <div class="max-w-full mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex justify-between items-center h-30" style="height: 60px !important;">

            <!-- Logo Section -->
            <div class="flex items-center">
                <a href="{{ route('index') }}" class="flex items-center space-x-3">
                    <img src="{{ asset('assets/images/company-logo.png') }}" alt="site logo" class="h-8 w-auto">
                    <span class="text-xl font-bold text-neutral-900 dark:text-white">Power Project</span>
                </a>
            </div>

            <!-- Navigation Menu -->
            <div class="menu-desktop flex items-center space-x-1">
                <!-- Analytics Dashboard Dropdown -->
                <div class="relative group">
                    <button class="nav-link flex items-center space-x-2 px-3 py-2 rounded-md text-sm font-medium text-neutral-700 dark:text-neutral-200 hover:text-primary-600 dark:hover:text-primary-400 hover:bg-neutral-100 dark:hover:bg-neutral-700 transition-colors duration-150">
                        <iconify-icon icon="solar:home-smile-angle-outline" class="text-lg"></iconify-icon>
                        <span>Analytics</span>
                        <iconify-icon icon="heroicons:chevron-down-20-solid" class="text-xs"></iconify-icon>
                    </button>
                    <div class="absolute left-0 mt-2 w-56 bg-white dark:bg-neutral-800 rounded-md shadow-lg opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-200 z-50 border border-neutral-200 dark:border-neutral-700">
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
                        </div>
                    </div>
                </div>

                <!-- Application Menu Items -->
                <a href="{{ route('email') }}" class="nav-link flex items-center space-x-2 px-3 py-2 rounded-md text-sm font-medium text-neutral-700 dark:text-neutral-200 hover:text-primary-600 dark:hover:text-primary-400 hover:bg-neutral-100 dark:hover:bg-neutral-700 transition-colors duration-150">
                    <iconify-icon icon="mage:email" class="text-lg"></iconify-icon>
                    <span>Email</span>
                </a>

                <a href="{{ route('activity') }}" class="nav-link flex items-center space-x-2 px-3 py-2 rounded-md text-sm font-medium text-neutral-700 dark:text-neutral-200 hover:text-primary-600 dark:hover:text-primary-400 hover:bg-neutral-100 dark:hover:bg-neutral-700 transition-colors duration-150">
                    <iconify-icon icon="solar:activity-outline" class="text-lg"></iconify-icon>
                    <span>Activity</span>
                </a>

                <a href="{{ route('chatMessage') }}" class="nav-link flex items-center space-x-2 px-3 py-2 rounded-md text-sm font-medium text-neutral-700 dark:text-neutral-200 hover:text-primary-600 dark:hover:text-primary-400 hover:bg-neutral-100 dark:hover:bg-neutral-700 transition-colors duration-150">
                    <iconify-icon icon="bi:chat-dots" class="text-lg"></iconify-icon>
                    <span>Chat</span>
                </a>

                <a href="{{ route('calendarMain') }}" class="nav-link flex items-center space-x-2 px-3 py-2 rounded-md text-sm font-medium text-neutral-700 dark:text-neutral-200 hover:text-primary-600 dark:hover:text-primary-400 hover:bg-neutral-100 dark:hover:bg-neutral-700 transition-colors duration-150">
                    <iconify-icon icon="solar:calendar-outline" class="text-lg"></iconify-icon>
                    <span>Calendar</span>
                </a>

                <a href="{{ route('kanban') }}" class="nav-link flex items-center space-x-2 px-3 py-2 rounded-md text-sm font-medium text-neutral-700 dark:text-neutral-200 hover:text-primary-600 dark:hover:text-primary-400 hover:bg-neutral-100 dark:hover:bg-neutral-700 transition-colors duration-150">
                    <iconify-icon icon="material-symbols:map-outline" class="text-lg"></iconify-icon>
                    <span>Kanban</span>
                </a>

                <!-- Invoice Dropdown -->
                <div class="relative group">
                    <button class="nav-link flex items-center space-x-2 px-3 py-2 rounded-md text-sm font-medium text-neutral-700 dark:text-neutral-200 hover:text-primary-600 dark:hover:text-primary-400 hover:bg-neutral-100 dark:hover:bg-neutral-700 transition-colors duration-150">
                        <iconify-icon icon="hugeicons:invoice-03" class="text-lg"></iconify-icon>
                        <span>Invoice</span>
                        <iconify-icon icon="heroicons:chevron-down-20-solid" class="text-xs"></iconify-icon>
                    </button>
                    <div class="absolute left-0 mt-2 w-48 bg-white dark:bg-neutral-800 rounded-md shadow-lg opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-200 z-50 border border-neutral-200 dark:border-neutral-700">
                        <div class="py-1">
                            <a href="{{ route('invoiceList') }}" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-200 hover:bg-neutral-100 dark:hover:bg-neutral-700">
                                <i class="ri-circle-fill text-primary-600"></i>
                                <span>List</span>
                            </a>
                            <a href="{{ route('invoicePreview') }}" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-200 hover:bg-neutral-100 dark:hover:bg-neutral-700">
                                <i class="ri-circle-fill text-warning-600"></i>
                                <span>Preview</span>
                            </a>
                            <a href="{{ route('invoiceAdd') }}" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-200 hover:bg-neutral-100 dark:hover:bg-neutral-700">
                                <i class="ri-circle-fill text-info-600"></i>
                                <span>Add new</span>
                            </a>
                        </div>
                    </div>
                </div>

                <!-- Components Dropdown (from Sidebar) -->
                <div class="relative group">
                    <button class="nav-link flex items-center space-x-2 px-3 py-2 rounded-md text-sm font-medium text-neutral-700 dark:text-neutral-200 hover:text-primary-600 dark:hover:text-primary-400 hover:bg-neutral-100 dark:hover:bg-neutral-700 transition-colors duration-150">
                        <iconify-icon icon="solar:document-text-outline" class="text-lg"></iconify-icon>
                        <span>Components</span>
                        <iconify-icon icon="heroicons:chevron-down-20-solid" class="text-xs"></iconify-icon>
                    </button>
                    <div class="absolute left-0 mt-2 w-56 bg-white dark:bg-neutral-800 rounded-md shadow-lg opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-200 z-50 border border-neutral-200 dark:border-neutral-700 dropdown-menu">
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

                <!-- Forms Dropdown -->
                <div class="relative group">
                    <button class="nav-link flex items-center space-x-2 px-3 py-2 rounded-md text-sm font-medium text-neutral-700 dark:text-neutral-200 hover:text-primary-600 dark:hover:text-primary-400 hover:bg-neutral-100 dark:hover:bg-neutral-700 transition-colors duration-150">
                        <iconify-icon icon="heroicons:document" class="text-lg"></iconify-icon>
                        <span>Forms</span>
                        <iconify-icon icon="heroicons:chevron-down-20-solid" class="text-xs"></iconify-icon>
                    </button>
                    <div class="absolute left-0 mt-2 w-56 bg-white dark:bg-neutral-800 rounded-md shadow-lg opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-200 z-50 border border-neutral-200 dark:border-neutral-700 dropdown-menu">
                        <div class="py-1">
                            <a href="{{ route('form') }}" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-200 hover:bg-neutral-100 dark:hover:bg-neutral-700"><span>Input Forms</span></a>
                            <a href="{{ route('formLayout') }}" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-200 hover:bg-neutral-100 dark:hover:bg-neutral-700"><span>Input Layout</span></a>
                            <a href="{{ route('formValidation') }}" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-200 hover:bg-neutral-100 dark:hover:bg-neutral-700"><span>Form Validation</span></a>
                            <a href="{{ route('wizard') }}" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-200 hover:bg-neutral-100 dark:hover:bg-neutral-700"><span>Form Wizard</span></a>
                        </div>
                    </div>
                </div>

                <!-- Tables Dropdown -->
                <div class="relative group">
                    <button class="nav-link flex items-center space-x-2 px-3 py-2 rounded-md text-sm font-medium text-neutral-700 dark:text-neutral-200 hover:text-primary-600 dark:hover:text-primary-400 hover:bg-neutral-100 dark:hover:bg-neutral-700 transition-colors duration-150">
                        <iconify-icon icon="mingcute:storage-line" class="text-lg"></iconify-icon>
                        <span>Tables</span>
                        <iconify-icon icon="heroicons:chevron-down-20-solid" class="text-xs"></iconify-icon>
                    </button>
                    <div class="absolute left-0 mt-2 w-56 bg-white dark:bg-neutral-800 rounded-md shadow-lg opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-200 z-50 border border-neutral-200 dark:border-neutral-700 dropdown-menu">
                        <div class="py-1">
                            <a href="{{ route('tableData') }}" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-200 hover:bg-neutral-100 dark:hover:bg-neutral-700"><span>Data Table</span></a>
                            <a href="{{ route('tableUsers') }}" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-200 hover:bg-neutral-100 dark:hover:bg-neutral-700"><span>Users</span></a>
                        </div>
                    </div>
                </div>

                <!-- Chart Dropdown -->
                <div class="relative group">
                    <button class="nav-link flex items-center space-x-2 px-3 py-2 rounded-md text-sm font-medium text-neutral-700 dark:text-neutral-200 hover:text-primary-600 dark:hover:text-primary-400 hover:bg-neutral-100 dark:hover:bg-neutral-700 transition-colors duration-150">
                        <iconify-icon icon="solar:pie-chart-outline" class="text-lg"></iconify-icon>
                        <span>Chart</span>
                        <iconify-icon icon="heroicons:chevron-down-20-solid" class="text-xs"></iconify-icon>
                    </button>
                    <div class="absolute left-0 mt-2 w-56 bg-white dark:bg-neutral-800 rounded-md shadow-lg opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-200 z-50 border border-neutral-200 dark:border-neutral-700 dropdown-menu">
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

                <!-- Settings Dropdown -->
                <div class="relative group">
                    <button class="nav-link flex items-center space-x-2 px-3 py-2 rounded-md text-sm font-medium text-neutral-700 dark:text-neutral-200 hover:text-primary-600 dark:hover:text-primary-400 hover:bg-neutral-100 dark:hover:bg-neutral-700 transition-colors duration-150">
                        <iconify-icon icon="icon-park-outline:setting-two" class="text-lg"></iconify-icon>
                        <span>Settings</span>
                        <iconify-icon icon="heroicons:chevron-down-20-solid" class="text-xs"></iconify-icon>
                    </button>
                    <div class="absolute left-0 mt-2 w-56 bg-white dark:bg-neutral-800 rounded-md shadow-lg opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-200 z-50 border border-neutral-200 dark:border-neutral-700 dropdown-menu">
                        <div class="py-1">
                            <a href="{{ route('company') }}" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-200 hover:bg-neutral-100 dark:hover:bg-neutral-700"><span>Company</span></a>
                            <a href="{{ route('notification') }}" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-200 hover:bg-neutral-100 dark:hover:bg-neutral-700"><span>Notification</span></a>
                            <a href="{{ route('notificationAlert') }}" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-200 hover:bg-neutral-100 dark:hover:bg-neutral-700"><span>Notification Alert</span></a>
                            <a href="{{ route('theme') }}" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-200 hover:bg-neutral-100 dark:hover:bg-neutral-700"><span>Theme</span></a>
                            <a href="{{ route('currencies') }}" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-200 hover:bg-neutral-100 dark:hover:bg-neutral-700"><span>Currencies</span></a>
                            <a href="{{ route('language') }}" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-200 hover:bg-neutral-100 dark:hover:bg-neutral-700"><span>Languages</span></a>
                            <a href="{{ route('paymentGateway') }}" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-200 hover:bg-neutral-100 dark:hover:bg-neutral-700"><span>Payment Gateway</span></a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Right Side Items -->
            <div class="flex items-center space-x-4">
                <div class="relative group">
                    <button class="nav-link flex items-center space-x-2 px-3 py-2 rounded-md text-sm font-medium text-neutral-700 dark:text-neutral-200 hover:text-primary-600 dark:hover:text-primary-400 hover:bg-neutral-100 dark:hover:bg-neutral-700 transition-colors duration-150">
                        <img src="{{ asset(session('user_avatar', 'assets/images/default-avatar.png')) }}" alt="User Avatar" class="h-6 w-6 rounded-full object-cover">
                        <span>{{ session('user_name', 'User') }}</span>
                        <iconify-icon icon="heroicons:chevron-down-20-solid" class="text-xs"></iconify-icon>
                    </button>
                    <div class="absolute right-0 mt-2 w-56 bg-white dark:bg-neutral-800 rounded-md shadow-lg opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-200 z-50 border border-neutral-200 dark:border-neutral-700">
                        <div class="py-1">
                            <div class="px-4 py-2">
                                <p class="text-sm text-neutral-700 dark:text-neutral-200">{{ session('user_name', 'User') }}</p>
                                <p class="text-sm font-medium text-neutral-900 dark:text-neutral-400 truncate">{{ session('user_role', 'User') }}</p>
                            </div>
                            <a href="{{ route('viewProfile') }}" class="flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-200 hover:bg-neutral-100 dark:hover:bg-neutral-700">
                                <iconify-icon icon="solar:user-linear" class="text-lg"></iconify-icon>
                                <span>My Profile</span>
                            </a>
                            <form method="POST" action="{{ route('logout') }}">
                                @csrf
                                <button type="submit" class="w-full text-left flex items-center space-x-3 px-4 py-2 text-sm text-neutral-700 dark:text-neutral-200 hover:bg-neutral-100 dark:hover:bg-neutral-700">
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

    <!-- Mobile Menu (Hidden by default, can be shown with JavaScript) -->
    <div class="md:hidden hidden bg-white dark:bg-neutral-800 border-t border-neutral-200 dark:border-neutral-700">
        <div class="px-2 pt-2 pb-3 space-y-1">
            <a href="{{ route('email') }}" class="flex items-center space-x-3 px-3 py-2 rounded-md text-base font-medium text-neutral-700 dark:text-neutral-200 hover:text-primary-600 dark:hover:text-primary-400 hover:bg-neutral-100 dark:hover:bg-neutral-700">
                <iconify-icon icon="mage:email" class="text-lg"></iconify-icon>
                <span>Email</span>
            </a>
            <a href="{{ route('activity') }}" class="flex items-center space-x-3 px-3 py-2 rounded-md text-base font-medium text-neutral-700 dark:text-neutral-200 hover:text-primary-600 dark:hover:text-primary-400 hover:bg-neutral-100 dark:hover:bg-neutral-700">
                <iconify-icon icon="solar:activity-outline" class="text-lg"></iconify-icon>
                <span>Activity</span>
            </a>
            <a href="{{ route('chatMessage') }}" class="flex items-center space-x-3 px-3 py-2 rounded-md text-base font-medium text-neutral-700 dark:text-neutral-200 hover:text-primary-600 dark:hover:text-primary-400 hover:bg-neutral-100 dark:hover:bg-neutral-700">
                <iconify-icon icon="bi:chat-dots" class="text-lg"></iconify-icon>
                <span>Chat</span>
            </a>
            <a href="{{ route('calendarMain') }}" class="flex items-center space-x-3 px-3 py-2 rounded-md text-base font-medium text-neutral-700 dark:text-neutral-200 hover:text-primary-600 dark:hover:text-primary-400 hover:bg-neutral-100 dark:hover:bg-neutral-700">
                <iconify-icon icon="solar:calendar-outline" class="text-lg"></iconify-icon>
                <span>Calendar</span>
            </a>
        </div>
    </div>
</nav>