<?php

// Script untuk menambahkan kolom user_id ke tabel time_boxings
try {
    // Konfigurasi database
    $host = 'localhost';
    $dbname = 'laravel';
    $username = 'user';
    $password = 'password';
    
    // Koneksi ke PostgreSQL
    $pdo = new PDO("pgsql:host=$host;dbname=$dbname", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
    // Cek apakah kolom user_id sudah ada
    $checkColumn = $pdo->query("
        SELECT column_name 
        FROM information_schema.columns 
        WHERE table_name = 'time_boxings' 
        AND column_name = 'user_id'
    ");
    
    if ($checkColumn->rowCount() > 0) {
        echo "✅ Kolom user_id sudah ada di tabel time_boxings\n";
    } else {
        // Tambahkan kolom user_id
        $pdo->exec("ALTER TABLE time_boxings ADD COLUMN user_id BIGINT;");
        echo "✅ Kolom user_id berhasil ditambahkan ke tabel time_boxings\n";
    }
    
    // Tampilkan struktur tabel
    $result = $pdo->query("
        SELECT column_name, data_type, is_nullable 
        FROM information_schema.columns 
        WHERE table_name = 'time_boxings' 
        ORDER BY ordinal_position
    ");
    
    echo "\n📋 Struktur tabel time_boxings:\n";
    echo "Column Name\t\tData Type\t\tNullable\n";
    echo "------------------------------------------------\n";
    
    while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
        echo sprintf("%-20s %-20s %s\n", 
            $row['column_name'], 
            $row['data_type'], 
            $row['is_nullable']
        );
    }
    
} catch (PDOException $e) {
    echo "❌ Error: " . $e->getMessage() . "\n";
}

