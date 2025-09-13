<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::table('time_boxings', function (Blueprint $table) {
            if (Schema::hasColumn('time_boxings', 'department')) {
                $table->dropColumn('department');
            }
            if (Schema::hasColumn('time_boxings', 'application')) {
                $table->dropColumn('application');
            }
        });
    }

    public function down(): void
    {
        Schema::table('time_boxings', function (Blueprint $table) {
            if (!Schema::hasColumn('time_boxings', 'department')) {
                $table->string('department')->nullable();
            }
            if (!Schema::hasColumn('time_boxings', 'application')) {
                $table->string('application')->nullable();
            }
        });
    }
};


