<aside class="sidebar">
    <button type="button" class="sidebar-close-btn !mt-4">
        <iconify-icon icon="radix-icons:cross-2"></iconify-icon>
    </button>
    <div>
        <a href="{{ route('index') }}" class="sidebar-logo">
            <img src="{{ asset('assets/images/company-logo.png') }}" alt="site logo" class="light-logo">
            <img src="{{ asset('assets/images/company-logo.png') }}" alt="site logo" class="dark-logo">
            <img src="{{ asset('assets/images/company-logo.png') }}" alt="site logo" class="logo-icon">
        </a>
    </div>
    <div class="sidebar-menu-area">
        <ul class="sidebar-menu" id="sidebar-menu">
            <li class="dropdown">
                <a href="javascript:void(0)">
                    <iconify-icon icon="solar:home-smile-angle-outline" class="menu-icon"></iconify-icon>
                    <span>Analytics Dashboard</span>
                </a>
                <ul class="sidebar-submenu">
                    <li>
                        <a href="{{ route('index') }}"><i class="ri-circle-fill circle-icon text-primary-600 w-auto"></i> AI</a>
                    </li>
                    <li>
                        <a href="{{ route('index2') }}"><i class="ri-circle-fill circle-icon text-warning-600 w-auto"></i> CRM</a>
                    </li>
                    <li>
                        <a href="{{ route('index3') }}"><i class="ri-circle-fill circle-icon text-info-600 w-auto"></i> eCommerce</a>
                    </li>
                    <li>
                        <a href="{{ route('index4') }}"><i class="ri-circle-fill circle-icon text-danger-600 w-auto"></i> Cryptocurrency</a>
                    </li>
                    <li>
                        <a href="{{ route('index5') }}"><i class="ri-circle-fill circle-icon text-success-600 w-auto"></i> Investment</a>
                    </li>
                    <li>
                        <a href="{{ route('index6') }}"><i class="ri-circle-fill circle-icon text-purple-600 w-auto"></i> LMS / Learning System</a>
                    </li>
                    <li>
                        <a href="{{ route('index7') }}"><i class="ri-circle-fill circle-icon text-info-600 w-auto"></i> NFT & Gaming</a>
                    </li>
                    <li>
                        <a href="{{ route('index8') }}"><i class="ri-circle-fill circle-icon text-danger-600 w-auto"></i> Medical</a>
                    </li>
                    <li>
                        <a href="{{ route('index9') }}"><i class="ri-circle-fill circle-icon text-purple-600 w-auto"></i> Analytics</a>
                    </li>
                </ul>
            </li>
            <li class="sidebar-menu-group-title">Application</li>
            <li>
                <a href="{{ route('email') }}">
                    <iconify-icon icon="mage:email" class="menu-icon"></iconify-icon>
                    <span>Email</span>
                </a>
            </li>
            <li>
                <a href="{{ route('chatMessage') }}">
                    <iconify-icon icon="bi:chat-dots" class="menu-icon"></iconify-icon>
                    <span>Chat</span>
                </a>
            </li>
            <li>
                <a href="{{ route('calendarMain') }}">
                    <iconify-icon icon="solar:calendar-outline" class="menu-icon"></iconify-icon>
                    <span>Calendar</span>
                </a>
            </li>
            <li>
                <a href="{{ route('kanban') }}">
                    <iconify-icon icon="material-symbols:map-outline" class="menu-icon"></iconify-icon>
                    <span>Kanban</span>
                </a>
            </li>
            <li class="dropdown">
                <a href="javascript:void(0)">
                    <iconify-icon icon="hugeicons:invoice-03" class="menu-icon"></iconify-icon>
                    <span>Invoice</span>
                </a>
                <ul class="sidebar-submenu">
                    <li>
                        <a href="{{ route('invoiceList') }}"><i class="ri-circle-fill circle-icon text-primary-600 w-auto"></i> List</a>
                    </li>
                    <li>
                        <a href="{{ route('invoicePreview') }}"><i class="ri-circle-fill circle-icon text-warning-600 w-auto"></i> Preview</a>
                    </li>
                    <li>
                        <a href="{{ route('invoiceAdd') }}"><i class="ri-circle-fill circle-icon text-info-600 w-auto"></i> Add new</a>
                    </li>
                    <li>
                        <a href="{{ route('invoiceEdit') }}"><i class="ri-circle-fill circle-icon text-danger-600 w-auto"></i> Edit</a>
                    </li>
                </ul>
            </li>
            <li class="dropdown">
                <a href="javascript:void(0)">
                    <iconify-icon icon="hugeicons:ai-brain-03" class="menu-icon"></iconify-icon>
                    <span>Ai Application</span>
                </a>
                <ul class="sidebar-submenu">
                    <li>
                        <a href="{{ route('textGenerator') }}"><i class="ri-circle-fill circle-icon text-primary-600 w-auto"></i> Text Generator</a>
                    </li>
                    <li>
                        <a href="{{ route('codeGenerator') }}"><i class="ri-circle-fill circle-icon text-warning-600 w-auto"></i> Code Generator</a>
                    </li>
                    <li>
                        <a href="{{ route('imageGenerator') }}"><i class="ri-circle-fill circle-icon text-info-600 w-auto"></i> Image Generator</a>
                    </li>
                    <li>
                        <a href="{{ route('voiceGenerator') }}"><i class="ri-circle-fill circle-icon text-danger-600 w-auto"></i> Voice Generator</a>
                    </li>
                    <li>
                        <a href="{{ route('videoGenerator') }}"><i class="ri-circle-fill circle-icon text-success-600 w-auto"></i> Video Generator</a>
                    </li>
                </ul>
            </li>

            <li class="dropdown">
                <a href="javascript:void(0)">
                    <iconify-icon icon="hugeicons:bitcoin-circle" class="menu-icon"></iconify-icon>
                    <span>Crypto Currency</span>
                </a>
                <ul class="sidebar-submenu">
                    <li>
                        <a href="{{ route('wallet') }}"><i class="ri-circle-fill circle-icon text-primary-600 w-auto"></i> Wallet</a>
                    </li>
                </ul>
            </li>

            <li class="sidebar-menu-group-title">UI Elements</li>

            <li class="dropdown">
                <a href="javascript:void(0)">
                    <iconify-icon icon="solar:document-text-outline" class="menu-icon"></iconify-icon>
                    <span>Components</span>
                </a>
                <ul class="sidebar-submenu">
                    <li>
                        <a href="{{ route('typography') }}"><i class="ri-circle-fill circle-icon text-primary-600 w-auto"></i> Typography</a>
                    </li>
                    <li>
                        <a href="{{ route('colors') }}"><i class="ri-circle-fill circle-icon text-warning-600 w-auto"></i> Colors</a>
                    </li>
                    <li>
                        <a href="{{ route('button') }}"><i class="ri-circle-fill circle-icon text-success-600 w-auto"></i> Button</a>
                    </li>
                    <li>
                        <a href="{{ route('dropdown') }}"><i class="ri-circle-fill circle-icon text-purple-600  dark:text-purple-400 w-auto"></i> Dropdown</a>
                    </li>
                    <li>
                        <a href="{{ route('alert') }}"><i class="ri-circle-fill circle-icon text-warning-600 w-auto"></i> Alerts</a>
                    </li>
                    <li>
                        <a href="{{ route('card') }}"><i class="ri-circle-fill circle-icon text-danger-600 w-auto"></i> Card</a>
                    </li>
                    <li>
                        <a href="{{ route('carousel') }}"><i class="ri-circle-fill circle-icon text-info-600 w-auto"></i> Carousel</a>
                    </li>
                    <li>
                        <a href="{{ route('avatar') }}"><i class="ri-circle-fill circle-icon text-success-600 w-auto"></i> Avatars</a>
                    </li>
                    <li>
                        <a href="{{ route('progress') }}"><i class="ri-circle-fill circle-icon text-primary-600 w-auto"></i> Progress bar</a>
                    </li>
                    <li>
                        <a href="{{ route('tabs') }}"><i class="ri-circle-fill circle-icon text-warning-600 w-auto"></i> Tab & Accordion</a>
                    </li>
                    <li>
                        <a href="{{ route('pagination') }}"><i class="ri-circle-fill circle-icon text-danger-600 w-auto"></i> Pagination</a>
                    </li>
                    <li>
                        <a href="{{ route('badges') }}"><i class="ri-circle-fill circle-icon text-info-600 w-auto"></i> Badges</a>
                    </li>
                    <li>
                        <a href="{{ route('tooltip') }}"><i class="ri-circle-fill circle-icon dark:text-purple-400 w-auto"></i> Tooltip & Popover</a>
                    </li>
                    <li>
                        <a href="{{ route('videos') }}"><i class="ri-circle-fill circle-icon text-cyan-600 w-auto"></i> Videos</a>
                    </li>
                    <li>
                        <a href="{{ route('starRating') }}"><i class="ri-circle-fill circle-icon text-[#7f27ff] w-auto"></i> Star Ratings</a>
                    </li>
                    <li>
                        <a href="{{ route('tags') }}"><i class="ri-circle-fill circle-icon text-[#8252e9] w-auto"></i> Tags</a>
                    </li>
                    <li>
                        <a href="{{ route('list') }}"><i class="ri-circle-fill circle-icon text-[#e30a0a] w-auto"></i> List</a>
                    </li>
                    <li>
                        <a href="{{ route('calendar') }}"><i class="ri-circle-fill circle-icon text-yellow-400 w-auto"></i> Calendar</a>
                    </li>
                    <li>
                        <a href="{{ route('radio') }}"><i class="ri-circle-fill circle-icon text-orange-500 w-auto"></i> Radio</a>
                    </li>
                    <li>
                        <a href="{{ route('switch') }}"><i class="ri-circle-fill circle-icon text-pink-600 w-auto"></i> Switch</a>
                    </li>
                    <li>
                        <a href="{{ route('imageUpload') }}"><i class="ri-circle-fill circle-icon text-primary-600 w-auto"></i> Upload</a>
                    </li>
                </ul>
            </li>
            <li class="dropdown">
                <a href="javascript:void(0)">
                    <iconify-icon icon="heroicons:document" class="menu-icon"></iconify-icon>
                    <span>Forms</span>
                </a>
                <ul class="sidebar-submenu">
                    <li>
                        <a href="{{ route('form') }}"><i class="ri-circle-fill circle-icon text-primary-600 w-auto"></i> Input Forms</a>
                    </li>
                    <li>
                        <a href="{{ route('formLayout') }}"><i class="ri-circle-fill circle-icon text-warning-600 w-auto"></i> Input Layout</a>
                    </li>
                    <li>
                        <a href="{{ route('formValidation') }}"><i class="ri-circle-fill circle-icon text-success-600 w-auto"></i> Form Validation</a>
                    </li>
                    <li>
                        <a href="{{ route('wizard') }}"><i class="ri-circle-fill circle-icon text-danger-600 w-auto"></i> Form Wizard</a>
                    </li>
                </ul>
            </li>
            <li class="dropdown">
                <a href="javascript:void(0)">
                    <iconify-icon icon="mingcute:storage-line" class="menu-icon"></iconify-icon>
                    <span>Tables</span>
                </a>
                <ul class="sidebar-submenu">
                    <li>
                        <a href="{{ route('tableData') }}"><i class="ri-circle-fill circle-icon text-warning-600 w-auto"></i> Data Table</a>
                    </li>
                    <li>
                        <a href="{{ route('tableUsers') }}"><i class="ri-circle-fill circle-icon text-success-600 w-auto"></i> Users</a>
                    </li>
                </ul>
            </li>
            <li class="dropdown">
                <a href="javascript:void(0)">
                    <iconify-icon icon="solar:pie-chart-outline" class="menu-icon"></iconify-icon>
                    <span>Chart</span>
                </a>
                <ul class="sidebar-submenu">
                    <li>
                        <a href="{{ route('lineChart') }}"><i class="ri-circle-fill circle-icon text-danger-600 w-auto"></i> Line Chart</a>
                    </li>
                    <li>
                        <a href="{{ route('columnChart') }}"><i class="ri-circle-fill circle-icon text-warning-600 w-auto"></i> Column Chart</a>
                    </li>
                    <li>
                        <a href="{{ route('pieChart') }}"><i class="ri-circle-fill circle-icon text-success-600 w-auto"></i> Pie Chart</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="{{ route('widgets') }}">
                    <iconify-icon icon="fe:vector" class="menu-icon"></iconify-icon>
                    <span>Widgets</span>
                </a>
            </li>

            <li class="sidebar-menu-group-title">Application</li>

            <li class="dropdown">
                <a href="javascript:void(0)">
                    <iconify-icon icon="icon-park-outline:setting-two" class="menu-icon"></iconify-icon>
                    <span>Settings</span>
                </a>
                <ul class="sidebar-submenu">
                    <li>
                        <a href="{{ route('company') }}"><i class="ri-circle-fill circle-icon text-primary-600 w-auto"></i> Company</a>
                    </li>
                    <li>
                        <a href="{{ route('notification') }}"><i class="ri-circle-fill circle-icon text-warning-600 w-auto"></i> Notification</a>
                    </li>
                    <li>
                        <a href="{{ route('notificationAlert') }}"><i class="ri-circle-fill circle-icon text-info-600 w-auto"></i> Notification Alert</a>
                    </li>
                    <li>
                        <a href="{{ route('theme') }}"><i class="ri-circle-fill circle-icon text-danger-600 w-auto"></i> Theme</a>
                    </li>
                    <li>
                        <a href="{{ route('currencies') }}"><i class="ri-circle-fill circle-icon text-danger-600 w-auto"></i> Currencies</a>
                    </li>
                    <li>
                        <a href="{{ route('language') }}"><i class="ri-circle-fill circle-icon text-danger-600 w-auto"></i> Languages</a>
                    </li>
                    <li>
                        <a href="{{ route('paymentGateway') }}"><i class="ri-circle-fill circle-icon text-danger-600 w-auto"></i> Payment Gateway</a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
    
    <!-- User Profile Section -->
    @if(session('user_id') && session('logged_in'))
    <div class="sidebar-user-profile">
        <div class="flex items-center space-x-3 p-4 bg-neutral-100 dark:bg-neutral-800 rounded-lg mx-4 mb-4">
            <img src="{{ asset('assets/images/users/komeng-avatar.png') }}" alt="User Avatar" class="w-12 h-12 rounded-full object-cover border-2 border-primary-200 dark:border-primary-700">
            <div class="flex-1 min-w-0">
                <p class="text-sm font-semibold text-neutral-900 dark:text-white truncate">
                    {{ session('user_name', 'User') }}
                </p>
                <p class="text-xs text-neutral-500 dark:text-neutral-400 truncate">
                    {{ session('user_email', 'user@example.com') }}
                </p>
                @if(session('user_role'))
                <span class="inline-block px-2 py-1 text-xs bg-green-100 dark:bg-green-900 text-green-600 dark:text-green-400 rounded-full mt-1">
                    {{ session('user_role') }}
                </span>
                @endif
            </div>
        </div>
    </div>
    @endif
</aside>