<?php

require_once 'vendor/autoload.php';

$app = require_once 'bootstrap/app.php';
$app->make(Illuminate\Contracts\Console\Kernel::class)->bootstrap();

echo "Testing PostgreSQL connection...\n";

try {
    DB::connection()->getPdo();
    echo "✅ Database connection successful!\n";

    $count = App\Models\Activity::count();
    echo "Activities count: " . $count . "\n";

    if ($count > 0) {
        echo "Sample activities:\n";
        $activities = App\Models\Activity::take(3)->get();
        foreach ($activities as $activity) {
            echo "- ID: {$activity->id}, Description: {$activity->description}\n";
        }
    }

} catch (\Exception $e) {
    echo "❌ Database connection failed: " . $e->getMessage() . "\n";
}