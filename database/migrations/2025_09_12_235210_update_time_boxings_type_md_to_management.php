<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        // Drop existing CHECK constraint first to allow updating values safely
        DB::statement('ALTER TABLE time_boxings DROP CONSTRAINT IF EXISTS time_boxings_type_check');

        // Update all records with 'Update to MD' to 'Update to Management'
        DB::statement("UPDATE time_boxings SET type = 'Update to Management' WHERE type = 'Update to MD'");

        // Add new CHECK constraint with 'Update to Management' instead of 'Update to MD'
        DB::statement("ALTER TABLE time_boxings ADD CONSTRAINT time_boxings_type_check CHECK (type IN (
            'General',
            'Submission Maintenance',
            'Update to Management',
            'Update to Team Bali',
            'Project Preparation',
            'Work Order',
            'Team Meeting',
            'Hotel Meeting',
            'Green Plan',
            'Others Project'
        ))");
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        // Drop existing CHECK constraint first to allow updating values safely
        DB::statement('ALTER TABLE time_boxings DROP CONSTRAINT IF EXISTS time_boxings_type_check');

        // Revert all records with 'Update to Management' back to 'Update to MD'
        DB::statement("UPDATE time_boxings SET type = 'Update to MD' WHERE type = 'Update to Management'");

        // Add back the old CHECK constraint with 'Update to MD'
        DB::statement("ALTER TABLE time_boxings ADD CONSTRAINT time_boxings_type_check CHECK (type IN (
            'General',
            'Submission Maintenance',
            'Update to MD',
            'Update to Team Bali',
            'Project Preparation',
            'Work Order',
            'Team Meeting',
            'Hotel Meeting',
            'Green Plan',
            'Others Project'
        ))");
    }
};
