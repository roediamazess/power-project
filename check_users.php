<?php

require_once 'vendor/autoload.php';

$app = require_once 'bootstrap/app.php';
$app->make(Illuminate\Contracts\Console\Kernel::class)->bootstrap();

use App\Models\User;

echo "Current Users in Database:\n";
echo "========================\n";

$users = User::all();
foreach ($users as $user) {
    echo "ID: {$user->id}\n";
    echo "Display Name: {$user->display_name}\n";
    echo "Full Name: {$user->full_name}\n";
    echo "Email: {$user->email}\n";
    echo "Role: {$user->user_role}\n";
    echo "Tier: {$user->tier}\n";
    echo "Start Work: {$user->start_work}\n";
    echo "Birthday: {$user->birthday}\n";
    echo "Created: {$user->created_at}\n";
    echo "------------------------\n";
}

echo "Total Users: " . $users->count() . "\n";