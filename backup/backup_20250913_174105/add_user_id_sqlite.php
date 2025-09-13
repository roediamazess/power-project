<?php

// Script untuk menambahkan kolom user_id ke tabel time_boxings di SQLite
try {
    // Koneksi ke SQLite
    $pdo = new PDO('sqlite:database/database.sqlite');
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
    // Cek apakah kolom user_id sudah ada
    $result = $pdo->query("PRAGMA table_info(time_boxings)");
    $columns = $result->fetchAll(PDO::FETCH_ASSOC);
    
    $hasUserId = false;
    foreach ($columns as $column) {
        if ($column['name'] === 'user_id') {
            $hasUserId = true;
            break;
        }
    }
    
    if ($hasUserId) {
        echo "✅ Kolom user_id sudah ada di tabel time_boxings\n";
    } else {
        // Tambahkan kolom user_id
        $pdo->exec("ALTER TABLE time_boxings ADD COLUMN user_id INTEGER;");
        echo "✅ Kolom user_id berhasil ditambahkan ke tabel time_boxings\n";
    }
    
    // Tampilkan struktur tabel
    $result = $pdo->query("PRAGMA table_info(time_boxings)");
    $columns = $result->fetchAll(PDO::FETCH_ASSOC);
    
    echo "\n📋 Struktur tabel time_boxings:\n";
    echo "Column Name\t\tType\t\tNot Null\tDefault\n";
    echo "--------------------------------------------------------\n";
    
    foreach ($columns as $column) {
        echo sprintf("%-20s %-15s %-10s %s\n", 
            $column['name'], 
            $column['type'], 
            $column['notnull'] ? 'YES' : 'NO',
            $column['dflt_value'] ?? 'NULL'
        );
    }
    
} catch (PDOException $e) {
    echo "❌ Error: " . $e->getMessage() . "\n";
}

