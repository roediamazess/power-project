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
        Schema::create('time_boxings', function (Blueprint $table) {
            $table->id();
            $table->string('timeboxing_id')->unique();
            $table->string('project_id');
            $table->integer('no');
            $table->date('information_date');
            $table->string('user_position');
            $table->enum('department', [
                'Food & Beverage',
                'Kitchen',
                'Room Division',
                'Front Office',
                'Housekeeping',
                'Engineering',
                'Sales & Marketing',
                'IT / EDP',
                'Accounting',
                'Executive Office'
            ]);
            $table->enum('application', [
                'Power FO',
                'My POS',
                'My MGR',
                'Power AR',
                'Power INV',
                'Power AP',
                'Power GL',
                'Keylock',
                'PABX',
                'DIM',
                'Dynamic Room Rate',
                'Channel Manager',
                'PB1',
                'Power SIGN',
                'Multi Properties',
                'Scanner ID',
                'IPOS',
                'Power Runner',
                'Power RA',
                'Power ME',
                'ECOS',
                'Cloud WS',
                'Power GO',
                'Dashpad',
                'IPTV',
                'HSIA',
                'SGI',
                'Guest Survey',
                'Loyalty Management',
                'AccPac',
                'GL Consolidation',
                'Self Check In',
                'Check In Desk',
                'Others'
            ]);
            $table->enum('type', [
                'Setup',
                'Question',
                'Issue',
                'Report Issue',
                'Report Request',
                'Feature Request'
            ]);
            $table->text('description');
            $table->text('action_solution')->nullable();
            $table->date('due_date')->nullable();
            $table->enum('status', [
                'Open',
                'On Progress',
                'Need Requirement',
                'Done'
            ])->default('Open');
            $table->string('cnc_number')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('time_boxings');
    }
};
