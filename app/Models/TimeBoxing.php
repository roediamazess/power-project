<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TimeBoxing extends Model
{
    protected $fillable = [
        'timeboxing_id',
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
    ];

    // Scope untuk filter berdasarkan status
    public function scopeByStatus($query, $status)
    {
        return $query->where('status', $status);
    }

    // Scope untuk filter berdasarkan department
    public function scopeByDepartment($query, $department)
    {
        return $query->where('department', $department);
    }

    // Scope untuk filter berdasarkan application
    public function scopeByApplication($query, $application)
    {
        return $query->where('application', $application);
    }

    // Accessor untuk status badge class
    public function getStatusBadgeClassAttribute()
    {
        return match($this->status) {
            'Open' => 'bg-blue-100 text-blue-800 dark:bg-blue-900 dark:text-blue-300',
            'On Progress' => 'bg-yellow-100 text-yellow-800 dark:bg-yellow-900 dark:text-yellow-300',
            'Need Requirement' => 'bg-orange-100 text-orange-800 dark:bg-orange-900 dark:text-orange-300',
            'Done' => 'bg-green-100 text-green-800 dark:bg-green-900 dark:text-green-300',
            default => 'bg-gray-100 text-gray-800 dark:bg-gray-900 dark:text-gray-300'
        };
    }
}
