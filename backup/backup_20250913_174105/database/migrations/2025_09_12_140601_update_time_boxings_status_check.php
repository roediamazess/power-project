<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;

return new class extends Migration {
    public function up(): void
    {
        // Drop existing CHECK constraint first
        DB::statement('ALTER TABLE time_boxings DROP CONSTRAINT IF EXISTS time_boxings_status_check');

        // Map legacy statuses to the new set where possible
        DB::statement("UPDATE time_boxings SET status = 'Brain Dump' WHERE status NOT IN (
            'Brain Dump', 'Priority List', 'Time Boxing', 'Completed', 'Cancel'
        )");
        DB::statement("UPDATE time_boxings SET status = 'Brain Dump' WHERE status = 'Open'");
        DB::statement("UPDATE time_boxings SET status = 'Time Boxing' WHERE status = 'On Progress'");
        DB::statement("UPDATE time_boxings SET status = 'Priority List' WHERE status = 'Need Requirement'");
        DB::statement("UPDATE time_boxings SET status = 'Completed' WHERE status = 'Done'");

        // Add new CHECK constraint
        DB::statement("ALTER TABLE time_boxings ADD CONSTRAINT time_boxings_status_check CHECK (status IN (
            'Brain Dump', 'Priority List', 'Time Boxing', 'Completed', 'Cancel'
        ))");
    }

    public function down(): void
    {
        // Revert to old set
        DB::statement('ALTER TABLE time_boxings DROP CONSTRAINT IF EXISTS time_boxings_status_check');
        DB::statement("ALTER TABLE time_boxings ADD CONSTRAINT time_boxings_status_check CHECK (status IN (
            'Open', 'On Progress', 'Need Requirement', 'Done'
        ))");
    }
};


