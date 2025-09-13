<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\TimeBoxing;
use Carbon\Carbon;

class TimeBoxingSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $timeBoxings = [
            [
                'timeboxing_id' => 'TB001',
                'project_id' => 'PRJ001',
                'no' => 1,
                'information_date' => Carbon::now()->toDateString(),
                'user_position' => 'Project Manager',
                'department' => 'IT / EDP',
                'application' => 'Power FO',
                'type' => 'Setup',
                'description' => 'Setup time boxing system for project management and productivity tracking',
                'action_solution' => 'Configure time tracking tools and establish time boxing protocols',
                'due_date' => Carbon::now()->addDays(7)->toDateString(),
                'status' => 'Open',
                'cnc_number' => 'CNC001',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'timeboxing_id' => 'TB002',
                'project_id' => 'PRJ002',
                'no' => 2,
                'information_date' => Carbon::now()->toDateString(),
                'user_position' => 'Developer',
                'department' => 'IT / EDP',
                'application' => 'Power AR',
                'type' => 'Issue',
                'description' => 'Implement time boxing features in the application',
                'action_solution' => 'Develop time tracking components and integrate with existing system',
                'due_date' => Carbon::now()->addDays(14)->toDateString(),
                'status' => 'On Progress',
                'cnc_number' => 'CNC002',
                'created_at' => Carbon::now()->subHours(1),
                'updated_at' => Carbon::now()->subMinutes(30),
            ],
            [
                'timeboxing_id' => 'TB003',
                'project_id' => 'PRJ003',
                'no' => 3,
                'information_date' => Carbon::now()->toDateString(),
                'user_position' => 'Analyst',
                'department' => 'Sales & Marketing',
                'application' => 'Power INV',
                'type' => 'Feature Request',
                'description' => 'Add time boxing analytics and reporting features',
                'action_solution' => 'Create dashboard for time boxing metrics and generate reports',
                'due_date' => Carbon::now()->addDays(21)->toDateString(),
                'status' => 'Done',
                'cnc_number' => 'CNC003',
                'created_at' => Carbon::now()->subHours(3),
                'updated_at' => Carbon::now()->subHours(1)->subMinutes(30),
            ],
        ];

        foreach ($timeBoxings as $timeBoxing) {
            TimeBoxing::create($timeBoxing);
        }
    }
}