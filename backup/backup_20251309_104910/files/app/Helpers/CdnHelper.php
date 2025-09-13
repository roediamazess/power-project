<?php

namespace App\Helpers;

class CdnHelper
{
    /**
     * Get CDN URL for asset
     *
     * @param string $path
     * @return string
     */
    public static function asset($path)
    {
        if (!config('cdn.enabled')) {
            return asset($path);
        }

        $cdnUrl = config('cdn.url');
        $version = config('cdn.cache.version');

        // Remove leading slash if present
        $path = ltrim($path, '/');

        // Add version query parameter for cache busting
        $separator = strpos($path, '?') === false ? '?' : '&';

        return $cdnUrl . '/' . $path . $separator . 'v=' . $version;
    }

    /**
     * Get CDN URL for CSS asset
     *
     * @param string $path
     * @return string
     */
    public static function css($path)
    {
        $fullPath = 'assets/css/' . $path;
        return self::asset($fullPath);
    }

    /**
     * Get CDN URL for JS asset
     *
     * @param string $path
     * @return string
     */
    public static function js($path)
    {
        $fullPath = 'assets/js/' . $path;
        return self::asset($fullPath);
    }

    /**
     * Get CDN URL for image asset
     *
     * @param string $path
     * @return string
     */
    public static function image($path)
    {
        $fullPath = 'assets/images/' . $path;
        return self::asset($fullPath);
    }

    /**
     * Get CDN URL for font asset
     *
     * @param string $path
     * @return string
     */
    public static function font($path)
    {
        $fullPath = 'assets/webfonts/' . $path;
        return self::asset($fullPath);
    }
}