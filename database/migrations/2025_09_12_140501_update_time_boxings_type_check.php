<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;

return new class extends Migration {
    public function up(): void
    {
        // Drop existing CHECK constraint first to allow updating values safely
        DB::statement('ALTER TABLE time_boxings DROP CONSTRAINT IF EXISTS time_boxings_type_check');

        // Normalize any legacy values to a safe default before adding the new constraint
        DB::statement("UPDATE time_boxings SET type = 'General' WHERE type NOT IN (
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
        )");

        // Add new CHECK constraint with the updated options
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

    public function down(): void
    {
        // Revert to previous options used originally
        DB::statement('ALTER TABLE time_boxings DROP CONSTRAINT IF EXISTS time_boxings_type_check');
        DB::statement("ALTER TABLE time_boxings ADD CONSTRAINT time_boxings_type_check CHECK (type IN (
            'Setup',
            'Question',
            'Issue',
            'Report Issue',
            'Report Request',
            'Feature Request'
        ))");
    }
};


