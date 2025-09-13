<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('users', function (Blueprint $table) {
            // Drop existing columns
            $table->dropColumn(['name', 'email_verified_at', 'remember_token']);
            
            // Add new columns
            $table->string('display_name')->after('id');
            $table->string('full_name')->after('display_name');
            $table->string('tier')->after('password');
            $table->string('user_role')->after('tier');
            $table->date('start_work')->after('user_role');
            $table->date('birthday')->after('start_work');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('users', function (Blueprint $table) {
            // Drop new columns
            $table->dropColumn(['display_name', 'full_name', 'tier', 'user_role', 'start_work', 'birthday']);
            
            // Restore original columns
            $table->string('name');
            $table->timestamp('email_verified_at')->nullable();
            $table->rememberToken();
        });
    }
};
