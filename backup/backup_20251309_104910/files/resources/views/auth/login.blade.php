<!DOCTYPE html>
<html lang="en" class="dark">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - PowerPro</title>
    <link rel="icon" type="image/png" href="{{ asset('assets/images/company-logo.png') }}">
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://unpkg.com/iconify-icon@1.0.7/dist/iconify-icon.min.js"></script>
    <style>
        .gradient-bg {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }
        .glass-effect {
            backdrop-filter: blur(10px);
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
        }
        .input-focus:focus {
            transform: translateY(-2px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        }
        .btn-hover:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
        }
        .logo-spin:hover {
            animation: spin 2s linear infinite;
        }
        @keyframes spin {
            from { transform: rotate(0deg); }
            to { transform: rotate(360deg); }
        }
    </style>
</head>
<body class="gradient-bg min-h-screen flex items-center justify-center p-4">
    <div class="w-full max-w-md">
        <!-- Login Card -->
        <div class="glass-effect rounded-2xl p-8 shadow-2xl">
            <!-- Logo Section -->
            <div class="text-center mb-8">
                <div class="mx-auto w-20 h-20 mb-4 logo-spin">
                    <img src="{{ asset('assets/images/company-logo.png') }}" alt="PowerPro" class="w-full h-full object-contain">
                </div>
                <h1 class="text-3xl font-bold text-white mb-2">PowerPro</h1>
                <p class="text-white/80 text-sm">Access Dashboard Analytics</p>
            </div>

            <!-- Error Messages -->
            @if ($errors->any())
                <div class="mb-6 p-4 bg-red-500/20 border border-red-500/30 rounded-lg">
                    <div class="flex items-center">
                        <iconify-icon icon="heroicons:exclamation-triangle" class="text-red-400 text-xl mr-3"></iconify-icon>
                        <div>
                            @foreach ($errors->all() as $error)
                                <p class="text-red-300 text-sm">{{ $error }}</p>
                            @endforeach
                        </div>
                    </div>
                </div>
            @endif

            @if (session('success'))
                <div class="mb-6 p-4 bg-green-500/20 border border-green-500/30 rounded-lg">
                    <div class="flex items-center">
                        <iconify-icon icon="heroicons:check-circle" class="text-green-400 text-xl mr-3"></iconify-icon>
                        <p class="text-green-300 text-sm">{{ session('success') }}</p>
                    </div>
                </div>
            @endif

            <!-- Login Form -->
            <form method="POST" action="{{ route('login') }}" class="space-y-6">
                @csrf
                
                <!-- Email Input -->
                <div>
                    <label for="email" class="block text-white/90 text-sm font-medium mb-2">
                        <iconify-icon icon="heroicons:envelope" class="inline mr-1"></iconify-icon>
                        Email Address
                    </label>
                    <input id="email" name="email" type="email" required 
                           class="w-full px-4 py-3 bg-white/10 border border-white/20 rounded-lg text-white placeholder-white/60 focus:outline-none focus:ring-2 focus:ring-white/50 focus:border-transparent input-focus transition-all duration-300"
                           placeholder="Enter your email address"
                           value="{{ old('email') }}">
                </div>

                <!-- Password Input -->
                <div>
                    <label for="password" class="block text-white/90 text-sm font-medium mb-2">
                        <iconify-icon icon="heroicons:lock-closed" class="inline mr-1"></iconify-icon>
                        Password
                    </label>
                    <input id="password" name="password" type="password" required 
                           class="w-full px-4 py-3 bg-white/10 border border-white/20 rounded-lg text-white placeholder-white/60 focus:outline-none focus:ring-2 focus:ring-white/50 focus:border-transparent input-focus transition-all duration-300"
                           placeholder="Enter your password">
                </div>

                <!-- Login Button -->
                <button type="submit" 
                        class="w-full bg-white text-gray-900 py-3 px-4 rounded-lg font-semibold hover:bg-white/90 focus:outline-none focus:ring-2 focus:ring-white/50 btn-hover transition-all duration-300 flex items-center justify-center">
                    <iconify-icon icon="heroicons:arrow-right-on-rectangle" class="mr-2"></iconify-icon>
                    Access Dashboard
                </button>
            </form>


            <!-- Footer -->
            <div class="mt-8 text-center">
                <p class="text-white/60 text-xs">
                    © 2024 PowerPro. All rights reserved.
                </p>
            </div>
        </div>
    </div>

    <!-- Background Animation -->
    <div class="fixed inset-0 -z-10 overflow-hidden">
        <div class="absolute -top-40 -right-40 w-80 h-80 bg-white/5 rounded-full blur-3xl"></div>
        <div class="absolute -bottom-40 -left-40 w-80 h-80 bg-white/5 rounded-full blur-3xl"></div>
    </div>
</body>
</html>
