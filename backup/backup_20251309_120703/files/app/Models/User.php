<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    use HasFactory, Notifiable;

    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'id';

    /**
     * The "type" of the primary key ID.
     *
     * @var string
     */
    protected $keyType = 'int';

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'display_name',
        'full_name',
        'email',
        'password',
        'tier',
        'user_role',
        'start_work',
        'birthday',
        'role',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
    ];

    /**
     * Get the attributes that should be cast.
     *
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'password' => 'hashed',
            'start_work' => 'date',
            'birthday' => 'date',
            'created_at' => 'datetime',
            'updated_at' => 'datetime',
        ];
    }

    // Role Management Methods
    public function hasRole($role)
    {
        return $this->role === $role;
    }

    public function isAdministrator()
    {
        return $this->hasRole('Administrator');
    }

    public function isManagement()
    {
        return $this->hasRole('Management');
    }

    public function isAdminOfficer()
    {
        return $this->hasRole('Admin Officer');
    }

    public function isUser()
    {
        return $this->hasRole('User');
    }

    public function isClient()
    {
        return $this->hasRole('Client');
    }

    // Get all available roles
    public static function getAvailableRoles()
    {
        return [
            'Administrator' => 'Administrator',
            'Management' => 'Management',
            'Admin Officer' => 'Admin Officer',
            'User' => 'User',
            'Client' => 'Client',
        ];
    }

    // Get role badge class for UI
    public function getRoleBadgeClassAttribute()
    {
        return match($this->role) {
            'Administrator' => 'bg-red-100 text-red-800 dark:bg-red-900 dark:text-red-300',
            'Management' => 'bg-purple-100 text-purple-800 dark:bg-purple-900 dark:text-purple-300',
            'Admin Officer' => 'bg-blue-100 text-blue-800 dark:bg-blue-900 dark:text-blue-300',
            'User' => 'bg-green-100 text-green-800 dark:bg-green-900 dark:text-green-300',
            'Client' => 'bg-yellow-100 text-yellow-800 dark:bg-yellow-900 dark:text-yellow-300',
            default => 'bg-gray-100 text-gray-800 dark:bg-gray-900 dark:text-gray-300'
        };
    }
}
