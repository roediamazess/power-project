<?php

return [
    /*
    |--------------------------------------------------------------------------
    | CDN Configuration
    |--------------------------------------------------------------------------
    |
    | Configure CDN settings for static assets in production environment.
    | Set APP_ENV=production in .env to enable CDN.
    |
    */

    'enabled' => env('APP_ENV') === 'production',

    'url' => env('CDN_URL', 'https://cdn.yourdomain.com'),

    /*
    |--------------------------------------------------------------------------
    | CDN Assets Mapping
    |--------------------------------------------------------------------------
    |
    | Map local asset paths to CDN URLs for better performance.
    | Only applied when CDN is enabled.
    |
    */

    'assets' => [
        'css' => [
            '/assets/css/' => env('CDN_URL', 'https://cdn.yourdomain.com') . '/assets/css/',
        ],
        'js' => [
            '/assets/js/' => env('CDN_URL', 'https://cdn.yourdomain.com') . '/assets/js/',
        ],
        'images' => [
            '/assets/images/' => env('CDN_URL', 'https://cdn.yourdomain.com') . '/assets/images/',
        ],
        'fonts' => [
            '/assets/webfonts/' => env('CDN_URL', 'https://cdn.yourdomain.com') . '/assets/webfonts/',
        ],
    ],

    /*
    |--------------------------------------------------------------------------
    | CDN Cache Settings
    |--------------------------------------------------------------------------
    |
    | Cache settings for CDN assets.
    |
    */

    'cache' => [
        'ttl' => env('CDN_CACHE_TTL', 31536000), // 1 year in seconds
        'version' => env('CDN_VERSION', '1.0.0'),
    ],
];