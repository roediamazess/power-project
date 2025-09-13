<?php
// Simple test untuk debug
echo "Testing database connection...\n";

try {
    // Load Laravel
    require_once 'vendor/autoload.php';
    $app = require_once 'bootstrap/app.php';
    $app->make('Illuminate\Contracts\Console\Kernel')->bootstrap();
    
    echo "Laravel loaded successfully\n";
    
    // Test database connection
    $pdo = DB::connection()->getPdo();
    echo "Database connected successfully\n";
    
    // Test if table exists
    $tables = DB::select("SHOW TABLES LIKE 'time_boxings'");
    echo "Time_boxings table exists: " . (count($tables) > 0 ? "YES" : "NO") . "\n";
    
    if (count($tables) > 0) {
        // Get table structure
        $columns = DB::select("DESCRIBE time_boxings");
        echo "Table structure:\n";
        foreach ($columns as $column) {
            echo "  {$column->Field} - {$column->Type}\n";
        }
        
        // Test insert
        echo "Testing insert...\n";
        $result = DB::table('time_boxings')->insert([
            'user_id' => 1,
            'project_id' => 'TEST-001',
            'no' => 999,
            'information_date' => '2025-09-13',
            'user_position' => 'Test',
            'department' => 'Test',
            'application' => 'Test',
            'type' => 'Test',
            'description' => 'Test',
            'status' => 'Test',
            'created_at' => now(),
            'updated_at' => now()
        ]);
        
        echo "Insert result: " . ($result ? "SUCCESS" : "FAILED") . "\n";
        
        // Clean up
        DB::table('time_boxings')->where('no', 999)->delete();
        echo "Test data cleaned up\n";
    }
    
} catch (Exception $e) {
    echo "Error: " . $e->getMessage() . "\n";
    echo "File: " . $e->getFile() . ":" . $e->getLine() . "\n";
}
