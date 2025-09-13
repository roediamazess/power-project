<?php

require_once 'vendor/autoload.php';

$app = require_once 'bootstrap/app.php';
$app->make(Illuminate\Contracts\Console\Kernel::class)->bootstrap();

use App\Models\User;
use Illuminate\Support\Facades\DB;

echo "=== USER DATA MIGRATION TOOL ===\n\n";

// Configuration for local PostgreSQL connection
echo "Enter your local PostgreSQL database details:\n";

echo "Host (default: localhost): ";
$host = trim(fgets(STDIN)) ?: 'localhost';

echo "Port (default: 5432): ";
$port = trim(fgets(STDIN)) ?: '5432';

echo "Database name (default: laravel): ";
$database = trim(fgets(STDIN)) ?: 'laravel';

echo "Username (default: user): ";
$username = trim(fgets(STDIN)) ?: 'user';

echo "Password (default: password): ";
$password = trim(fgets(STDIN)) ?: 'password';

$localDbConfig = [
    'host' => $host,
    'port' => $port,
    'database' => $database,
    'username' => $username,
    'password' => $password,
];

echo "1. Connecting to local PostgreSQL database...\n";

try {
    // Connect to local database
    $localPdo = new PDO(
        "pgsql:host={$localDbConfig['host']};port={$localDbConfig['port']};dbname={$localDbConfig['database']}",
        $localDbConfig['username'],
        $localDbConfig['password']
    );

    echo "✅ Connected to local database successfully!\n\n";

    // Get users from local database
    echo "2. Fetching users from local database...\n";
    $stmt = $localPdo->query("SELECT * FROM users ORDER BY id");
    $localUsers = $stmt->fetchAll(PDO::FETCH_ASSOC);

    echo "📊 Found " . count($localUsers) . " users in local database:\n";

    foreach ($localUsers as $user) {
        echo "   - ID: {$user['id']}, Name: {$user['display_name']}, Email: {$user['email']}\n";
    }

    echo "\n3. Checking current users in Docker database...\n";
    $dockerUsers = User::all();
    echo "📊 Found " . $dockerUsers->count() . " users in Docker database\n";

    if ($dockerUsers->count() > 0) {
        echo "⚠️  Docker database already has users. Options:\n";
        echo "   1. Skip existing users\n";
        echo "   2. Replace all users\n";
        echo "   3. Cancel migration\n";

        echo "\nChoose option (1-3): ";
        $option = trim(fgets(STDIN));

        if ($option == '3') {
            echo "❌ Migration cancelled by user\n";
            exit;
        }

        if ($option == '2') {
            echo "🗑️  Deleting existing users in Docker database...\n";
            User::truncate();
            echo "✅ All existing users deleted\n";
        }
    }

    echo "\n4. Migrating users to Docker database...\n";

    $migrated = 0;
    $skipped = 0;

    foreach ($localUsers as $localUser) {
        // Check if user already exists (by email)
        $existingUser = User::where('email', $localUser['email'])->first();

        if ($existingUser && $option == '1') {
            echo "⏭️  Skipping existing user: {$localUser['email']}\n";
            $skipped++;
            continue;
        }

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

        if ($existingUser) {
            // Update existing user
            $existingUser->update($userData);
            echo "🔄 Updated user: {$localUser['email']}\n";
        } else {
            // Create new user
            User::create($userData);
            echo "✅ Created user: {$localUser['email']}\n";
        }

        $migrated++;
    }

    echo "\n🎉 Migration completed!\n";
    echo "📊 Summary:\n";
    echo "   - Migrated: $migrated users\n";
    echo "   - Skipped: $skipped users\n";
    echo "   - Total in Docker DB: " . User::count() . " users\n";

    // Verify migration
    echo "\n5. Verification - Users in Docker database:\n";
    $finalUsers = User::all();
    foreach ($finalUsers as $user) {
        echo "   ✅ {$user->display_name} ({$user->email}) - {$user->user_role}\n";
    }

} catch (Exception $e) {
    echo "❌ Error during migration: " . $e->getMessage() . "\n";
    echo "💡 Make sure:\n";
    echo "   - Your local PostgreSQL is running\n";
    echo "   - Database credentials are correct\n";
    echo "   - Local database is accessible\n";
}

echo "\n=== MIGRATION TOOL COMPLETED ===\n";