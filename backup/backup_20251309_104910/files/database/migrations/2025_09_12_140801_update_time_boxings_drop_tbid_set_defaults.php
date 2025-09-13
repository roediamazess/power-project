<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration {
    public function up(): void
    {
        // Drop unique and column timeboxing_id if exists
        if (Schema::hasColumn('time_boxings', 'timeboxing_id')) {
            // If there is a unique index, try to drop it by inferring name
            try { DB::statement('ALTER TABLE time_boxings DROP CONSTRAINT IF EXISTS time_boxings_timeboxing_id_unique'); } catch (\Throwable $e) {}
            Schema::table('time_boxings', function (Blueprint $table) {
                $table->dropColumn('timeboxing_id');
            });
        }

        // Ensure defaults: project_id -> empty string, cnc_number -> empty string
        Schema::table('time_boxings', function (Blueprint $table) {
            if (Schema::hasColumn('time_boxings', 'project_id')) {
                $table->string('project_id')->default('')->nullable(false)->change();
            }
            if (Schema::hasColumn('time_boxings', 'cnc_number')) {
                $table->string('cnc_number')->default('')->nullable()->change();
            }
        });
    }

    public function down(): void
    {
        Schema::table('time_boxings', function (Blueprint $table) {
            if (!Schema::hasColumn('time_boxings', 'timeboxing_id')) {
                $table->string('timeboxing_id')->nullable();
            }
            if (Schema::hasColumn('time_boxings', 'project_id')) {
                $table->string('project_id')->nullable(false)->default(null)->change();
            }
            if (Schema::hasColumn('time_boxings', 'cnc_number')) {
                $table->string('cnc_number')->nullable()->default(null)->change();
            }
        });
    }
};


