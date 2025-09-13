<?php

require_once 'vendor/autoload.php';

$app = require_once 'bootstrap/app.php';
$app->make(Illuminate\Contracts\Console\Kernel::class)->bootstrap();

use App\Models\User;
use Illuminate\Support\Facades\DB;

echo "=== SIMPLE USER DATA MIGRATION TOOL ===\n\n";

// Try multiple connection configurations
$connectionConfigs = [
    [
        'host' => 'host.docker.internal',
        'port' => '5432',
        'database' => 'power-project',
        'username' => 'postgres',
        'password' => 'password',
    ],
    [
        'host' => 'host.docker.internal',
        'port' => '5432',
        'database' => 'power-project',
        'username' => 'postgres',
        'password' => '',
    ],
    [
        'host' => 'host.docker.internal',
        'port' => '5432',
        'database' => 'power-project',
        'username' => 'user',
        'password' => 'password',
    ],
    [
        'host' => 'host.docker.internal',
        'port' => '5432',
        'database' => 'power-project',
        'username' => 'user',
        'password' => '',
    ],
];

$localDbConfig = null;
foreach ($connectionConfigs as $config) {
    try {
        $pdo = new PDO(
            "pgsql:host={$config['host']};port={$config['port']};dbname={$config['database']}",
            $config['username'],
            $config['password']
        );
        $localDbConfig = $config;
        echo "✅ Connected successfully with username: {$config['username']}\n";
        break;
    } catch (Exception $e) {
        continue;
    }
}

if (!$localDbConfig) {
    echo "❌ Could not connect to local database with any configuration\n";
    exit(1);
}

echo "🔌 Connecting to local PostgreSQL database...\n";
echo "   Host: {$localDbConfig['host']}:{$localDbConfig['port']}\n";
echo "   Database: {$localDbConfig['database']}\n";
echo "   Username: {$localDbConfig['username']}\n\n";

try {
    // Connect to local database
    $localPdo = new PDO(
        "pgsql:host={$localDbConfig['host']};port={$localDbConfig['port']};dbname={$localDbConfig['database']}",
        $localDbConfig['username'],
        $localDbConfig['password']
    );

    echo "✅ Connected to local database successfully!\n\n";

    // Get users from local database
    echo "📊 Fetching users from local database...\n";
    $stmt = $localPdo->query("SELECT * FROM users ORDER BY id");
    $localUsers = $stmt->fetchAll(PDO::FETCH_ASSOC);

    echo "📋 Found " . count($localUsers) . " users in local database:\n";

    foreach ($localUsers as $user) {
        echo "   👤 {$user['display_name']} ({$user['email']}) - {$user['user_role']}\n";
    }

    echo "\n🔍 Checking current users in Docker database...\n";
    $dockerUsers = User::all();
    echo "📊 Found " . $dockerUsers->count() . " users in Docker database\n";

    if ($dockerUsers->count() > 0) {
        echo "\n⚠️  Docker database already has users!\n";
        echo "🗑️  Deleting existing users to replace with local data...\n";
        User::truncate();
        echo "✅ Existing users deleted\n";
    }

    echo "\n🚀 Migrating users to Docker database...\n";

    $migrated = 0;
    $errors = 0;

    foreach ($localUsers as $localUser) {
        try {
            // Map local user data to Docker user structure
            $userData = [
                'display_name' => $localUser['display_name'] ?? $localUser['name'] ?? 'User',
                'full_name' => $localUser['full_name'] ?? $localUser['display_name'] ?? $localUser['name'] ?? 'User',
                'email' => $localUser['email'],
                'password' => $localUser['password'], // Keep existing password hash
                'tier' => $localUser['tier'] ?? 'Standard',
                'user_role' => $localUser['user_role'] ?? 'User',
                'start_work' => $localUser['start_work'] ?? now()->format('Y-m-d'),
                'birthday' => $localUser['birthday'] ?? null,
                'created_at' => $localUser['created_at'] ?? now(),
                'updated_at' => $localUser['updated_at'] ?? now(),
            ];

            // Create new user
            User::create($userData);
            echo "✅ Migrated: {$localUser['display_name']} ({$localUser['email']})\n";
            $migrated++;

        } catch (Exception $e) {
            echo "❌ Error migrating user {$localUser['email']}: " . $e->getMessage() . "\n";
            $errors++;
        }
    }

    echo "\n🎉 Migration completed!\n";
    echo "📊 Summary:\n";
    echo "   ✅ Successfully migrated: $migrated users\n";
    if ($errors > 0) {
        echo "   ❌ Errors: $errors users\n";
    }
    echo "   📈 Total users in Docker DB: " . User::count() . " users\n";

    // Show final users
    echo "\n📋 Final users in Docker database:\n";
    $finalUsers = User::all();
    foreach ($finalUsers as $user) {
        echo "   👤 {$user->display_name} ({$user->email}) - {$user->user_role}\n";
    }

} catch (Exception $e) {
    echo "❌ Error during migration: " . $e->getMessage() . "\n";
    echo "\n💡 Troubleshooting:\n";
    echo "   1. Make sure your local PostgreSQL is running\n";
    echo "   2. Check database credentials in this file\n";
    echo "   3. Ensure local database is accessible\n";
    echo "   4. Check if PostgreSQL PHP extension is installed\n";
}

echo "\n=== MIGRATION COMPLETED ===\n";