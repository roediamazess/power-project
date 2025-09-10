<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Activity extends Model
{
    protected $fillable = [
        'activity_id',
        'project_id',
        'no',
        'information_date',
        'user_position',
        'department',
        'application',
        'type',
        'description',
        'action_solution',
        'due_date',
        'status',
        'cnc_number'
    ];

    protected $casts = [
        'information_date' => 'date',
        'due_date' => 'date',
        'no' => 'integer'
    ];

    // Accessor for formatted activity ID
    public function getFormattedActivityIdAttribute()
    {
        return 'ACT-' . str_pad($this->id, 3, '0', STR_PAD_LEFT);
    }

    // Scope for filtering by status
    public function scopeByStatus($query, $status)
    {
        return $query->where('status', $status);
    }

    // Scope for filtering by department
    public function scopeByDepartment($query, $department)
    {
        return $query->where('department', $department);
    }

    // Scope for filtering by application
    public function scopeByApplication($query, $application)
    {
        return $query->where('application', $application);
    }
}
