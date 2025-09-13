<?php
// Debug script untuk test TimeBoxing creation
require_once 'vendor/autoload.php';

use Illuminate\Support\Facades\DB;
use App\Models\TimeBoxing;

// Bootstrap Laravel
$app = require_once 'bootstrap/app.php';
$app->make('Illuminate\Contracts\Console\Kernel')->bootstrap();

try {
    echo "🔍 Testing TimeBoxing creation...\n";
    
    // Test data
    $testData = [
        'user_id' => 1,
        'project_id' => 'PROJ-001',
        'no' => 999, // Use a high number to avoid conflicts
        'information_date' => '2025-09-13',
        'user_position' => 'Staff',
        'department' => 'IT / EDP',
        'application' => 'Power FO',
        'type' => 'General',
        'description' => 'Debug test activity',
        'action_solution' => '',
        'due_date' => null,
        'status' => 'Brain Dump',
        'cnc_number' => ''
    ];
    
    echo "📝 Test data: " . json_encode($testData, JSON_PRETTY_PRINT) . "\n";
    
    // Check if table exists
    $tableExists = DB::select("SHOW TABLES LIKE 'time_boxings'");
    echo "🗄️ Table exists: " . (count($tableExists) > 0 ? "YES" : "NO") . "\n";
    
    if (count($tableExists) > 0) {
        // Check table structure
        $columns = DB::select("DESCRIBE time_boxings");
        echo "📋 Table columns:\n";
        foreach ($columns as $column) {
            echo "  - {$column->Field} ({$column->Type})\n";
        }
        
        // Check current max no
        $maxNo = DB::table('time_boxings')->max('no');
        echo "🔢 Current max no: " . ($maxNo ?? 'NULL') . "\n";
        
        // Test creating TimeBoxing
        echo "🔄 Creating TimeBoxing...\n";
        $timeBoxing = new TimeBoxing();
        $timeBoxing->fill($testData);
        $timeBoxing->save();
        
        echo "✅ TimeBoxing created successfully! ID: " . $timeBoxing->id . "\n";
        
        // Clean up test data
        $timeBoxing->delete();
        echo "🗑️ Test data cleaned up\n";
        
    } else {
        echo "❌ Table 'time_boxings' does not exist!\n";
    }
    
} catch (Exception $e) {
    echo "💥 Error: " . $e->getMessage() . "\n";
    echo "📍 File: " . $e->getFile() . ":" . $e->getLine() . "\n";
    echo "🔍 Trace:\n" . $e->getTraceAsString() . "\n";
}
