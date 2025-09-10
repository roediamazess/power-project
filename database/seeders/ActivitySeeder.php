<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Activity;

class ActivitySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $activities = [
            [
                'activity_id' => 1,
                'project_id' => 'PROJ-2024-001',
                'no' => 1,
                'information_date' => '2024-09-10',
                'user_position' => 'John Doe - Software Developer',
                'department' => 'IT / EDP',
                'application' => 'Power FO',
                'type' => 'Feature Request',
                'description' => 'Implement new dashboard with real-time analytics and KPI monitoring',
                'action_solution' => 'Added new API endpoints and updated frontend components with Chart.js integration',
                'due_date' => '2024-09-15',
                'status' => 'Done',
                'cnc_number' => 'CNC-2024-001'
            ],
            [
                'activity_id' => 2,
                'project_id' => 'PROJ-2024-002',
                'no' => 2,
                'information_date' => '2024-09-09',
                'user_position' => 'Jane Smith - System Analyst',
                'department' => 'Front Office',
                'application' => 'My POS',
                'type' => 'Issue',
                'description' => 'POS system not calculating taxes correctly for service charges',
                'action_solution' => 'Fixed tax calculation algorithm in payment processing module',
                'due_date' => '2024-09-12',
                'status' => 'On Progress',
                'cnc_number' => 'CNC-2024-002'
            ],
            [
                'activity_id' => 3,
                'project_id' => 'PROJ-2024-003',
                'no' => 3,
                'information_date' => '2024-09-08',
                'user_position' => 'Mike Johnson - IT Manager',
                'department' => 'Engineering',
                'application' => 'Power INV',
                'type' => 'Setup',
                'description' => 'Configure inventory management system for new warehouse location',
                'action_solution' => 'Setting up warehouse locations, item categories, and stock management parameters',
                'due_date' => '2024-09-20',
                'status' => 'Open',
                'cnc_number' => 'CNC-2024-003'
            ],
            [
                'activity_id' => 4,
                'project_id' => 'PROJ-2024-004',
                'no' => 4,
                'information_date' => '2024-09-07',
                'user_position' => 'Sarah Wilson - Business Analyst',
                'department' => 'Sales & Marketing',
                'application' => 'Power AR',
                'type' => 'Report Request',
                'description' => 'Need monthly sales performance report with trend analysis',
                'action_solution' => 'Created new report template with dynamic date ranges and export functionality',
                'due_date' => '2024-09-18',
                'status' => 'Need Requirement',
                'cnc_number' => 'CNC-2024-004'
            ],
            [
                'activity_id' => 5,
                'project_id' => 'PROJ-2024-005',
                'no' => 5,
                'information_date' => '2024-09-06',
                'user_position' => 'David Brown - Network Administrator',
                'department' => 'IT / EDP',
                'application' => 'IPTV',
                'type' => 'Question',
                'description' => 'IPTV streaming quality issues in executive offices',
                'action_solution' => 'Upgraded network infrastructure and optimized streaming parameters',
                'due_date' => '2024-09-14',
                'status' => 'Done',
                'cnc_number' => 'CNC-2024-005'
            ],
            [
                'activity_id' => 6,
                'project_id' => 'PROJ-2024-006',
                'no' => 6,
                'information_date' => '2024-09-05',
                'user_position' => 'Lisa Chen - Accounting Manager',
                'department' => 'Accounting',
                'application' => 'Power GL',
                'type' => 'Feature Request',
                'description' => 'Add multi-currency support for international transactions',
                'action_solution' => 'Implemented currency conversion module with real-time exchange rates',
                'due_date' => '2024-09-25',
                'status' => 'On Progress',
                'cnc_number' => 'CNC-2024-006'
            ],
            [
                'activity_id' => 7,
                'project_id' => 'PROJ-2024-007',
                'no' => 7,
                'information_date' => '2024-09-04',
                'user_position' => 'Robert Taylor - Housekeeping Supervisor',
                'department' => 'Housekeeping',
                'application' => 'Power ME',
                'type' => 'Setup',
                'description' => 'Configure maintenance scheduling system for equipment tracking',
                'action_solution' => 'Set up preventive maintenance schedules and notification system',
                'due_date' => '2024-09-22',
                'status' => 'Open',
                'cnc_number' => 'CNC-2024-007'
            ],
            [
                'activity_id' => 8,
                'project_id' => 'PROJ-2024-008',
                'no' => 8,
                'information_date' => '2024-09-03',
                'user_position' => 'Maria Garcia - Front Desk Manager',
                'department' => 'Front Office',
                'application' => 'Check In Desk',
                'type' => 'Issue',
                'description' => 'Guest check-in process taking too long during peak hours',
                'action_solution' => 'Optimized check-in workflow and added express check-in option',
                'due_date' => '2024-09-16',
                'status' => 'Done',
                'cnc_number' => 'CNC-2024-008'
            ]
        ];

        foreach ($activities as $activity) {
            Activity::create($activity);
        }
    }
}
