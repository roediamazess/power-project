<?php

// Simple script to add user_id column to time_boxings table using PDO
try {
    $pdo = new PDO('sqlite:database/database.sqlite');
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
    // Check if column exists
    $result = $pdo->query("PRAGMA table_info(time_boxings)");
    $columns = [];
    while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
        $columns[] = $row['name'];
    }
    
    if (in_array('user_id', $columns)) {
        echo "✅ Column user_id already exists\n";
    } else {
        // Add the column
        $pdo->exec("ALTER TABLE time_boxings ADD COLUMN user_id INTEGER");
        echo "✅ Column user_id added successfully\n";
    }
    
    // Show table structure
    $result = $pdo->query("PRAGMA table_info(time_boxings)");
    echo "\n📋 Table structure:\n";
    while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
        echo $row['name'] . " - " . $row['type'] . "\n";
    }
    
} catch (PDOException $e) {
    echo "❌ Error: " . $e->getMessage() . "\n";
}
