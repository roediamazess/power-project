<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $users = [
            [
                'display_name' => 'Komeng',
                'full_name' => 'Rudianto',
                'email' => 'pms@powerpro.id',
                'password' => Hash::make('password123'),
                'tier' => 'Premium',
                'user_role' => 'Administrator',
                'start_work' => '2024-01-01',
                'birthday' => '1990-01-01',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'display_name' => 'Admin',
                'full_name' => 'Administrator User',
                'email' => 'admin@powerpro.cloud',
                'password' => Hash::make('password123'),
                'tier' => 'Premium',
                'user_role' => 'Administrator',
                'start_work' => '2024-01-01',
                'birthday' => '1990-01-01',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'display_name' => 'Manager',
                'full_name' => 'Manager User',
                'email' => 'manager@powerpro.cloud',
                'password' => Hash::make('password123'),
                'tier' => 'Standard',
                'user_role' => 'Manager',
                'start_work' => '2024-02-01',
                'birthday' => '1985-05-15',
                'created_at' => now(),
                'updated_at' => now(),
            ],
        ];

        foreach ($users as $user) {
            User::create($user);
        }
    }
}