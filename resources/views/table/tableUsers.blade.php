@extends('layout.layout')
@php
    $title='Users Table';
    $subTitle = 'Users Data Table';
@endphp

@section('content')

    <div class="grid grid-cols-1 lg:grid-cols-12 gap-6">
        <div class="col-span-12">
            <div class="card border-0 overflow-hidden h-full">
                <div class="card-header">
                    <div class="flex justify-between items-center">
                        <div>
                            <h5 class="card-title text-lg mb-0">Users Data Table</h5>
                            <p class="text-sm text-neutral-500 dark:text-neutral-400">Complete list of users with their information</p>
                        </div>
                        <div class="bulk-actions">
                            <button class="btn btn-primary btn-sm" onclick="toggleEditMode()" id="edit-mode-btn">
                                <i class="ri-edit-line"></i> Edit Mode
                            </button>
                            <button class="btn btn-success btn-sm" onclick="saveAllUsers()" id="save-all-btn" style="display: none;">
                                <i class="ri-save-line"></i> Save All
                            </button>
                            <button class="btn btn-secondary btn-sm" onclick="cancelAllEdits()" id="cancel-all-btn" style="display: none;">
                                <i class="ri-close-line"></i> Cancel All
                            </button>
                        </div>
                    </div>
                </div>
                
                <!-- Keyboard Instructions -->
                <div class="keyboard-instructions" id="keyboard-instructions" style="display: none;">
                    <h6>📝 Excel-like Keyboard Navigation</h6>
                    <ul>
                        <li><strong>F2</strong> - Edit current field</li>
                        <li><strong>Arrow Keys</strong> - Navigate between fields and rows</li>
                        <li><strong>Enter</strong> - Save current field and move to next</li>
                        <li><strong>Escape</strong> - Cancel current edit</li>
                        <li><strong>Tab</strong> - Move to next field</li>
                    </ul>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table border-0 mb-0">
                            <thead>
                                <tr>
                                    <th class="!rounded-s-none">#</th>
                                    <th>Display Name</th>
                                    <th>Full Name</th>
                                    <th>Email</th>
                                    <th>Password</th>
                                    <th>Tier</th>
                                    <th>User Role</th>
                                    <th>Start Work</th>
                                    <th>Birthday</th>
                                    <th class="!rounded-e-none">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($users as $index => $user)
                                <tr id="user-row-{{ $index }}" class="user-row">
                                    <td class="fw-semibold">{{ $index + 1 }}</td>
                                    <td>
                                        <span class="fw-semibold text-muted">{{ $user->display_name }}</span>
                                        <small class="text-muted d-block">(Read Only)</small>
                                    </td>
                                    <td>
                                        <span class="display-field" data-field="full_name">{{ $user->full_name }}</span>
                                        <input type="text" class="form-control edit-field" value="{{ $user->full_name }}" style="display: none;" data-field="full_name">
                                    </td>
                                    <td>
                                        <span class="text-muted">
                                            <a href="mailto:{{ $user->email }}" class="text-primary-600 dark:text-primary-400 hover:underline">
                                                {{ $user->email }}
                                            </a>
                                        </span>
                                        <small class="text-muted d-block">(Read Only)</small>
                                    </td>
                                    <td>
                                        <span class="display-field text-muted text-sm" data-field="password">••••••••</span>
                                        <input type="password" class="form-control edit-field" placeholder="Enter new password" style="display: none;" data-field="password">
                                    </td>
                                    <td>
                                        <span class="display-field badge bg-success-100 text-success-600 dark:bg-success-900 dark:text-success-400" data-field="tier">
                                            {{ $user->tier }}
                                        </span>
                                        <select class="form-control edit-field" style="display: none;" data-field="tier">
                                            <option value="New Born" {{ $user->tier == 'New Born' ? 'selected' : '' }}>New Born</option>
                                            <option value="Tier 1" {{ $user->tier == 'Tier 1' ? 'selected' : '' }}>Tier 1</option>
                                            <option value="Tier 2" {{ $user->tier == 'Tier 2' ? 'selected' : '' }}>Tier 2</option>
                                            <option value="Tier 3" {{ $user->tier == 'Tier 3' ? 'selected' : '' }}>Tier 3</option>
                                        </select>
                                    </td>
                                    <td>
                                        <span class="display-field badge bg-info-100 text-info-600 dark:bg-info-900 dark:text-info-400" data-field="user_role">
                                            {{ $user->user_role }}
                                        </span>
                                        <select class="form-control edit-field" style="display: none;" data-field="user_role">
                                            <option value="Administrator" {{ $user->user_role == 'Administrator' ? 'selected' : '' }}>Administrator</option>
                                            <option value="Admin Officer" {{ $user->user_role == 'Admin Officer' ? 'selected' : '' }}>Admin Officer</option>
                                            <option value="User" {{ $user->user_role == 'User' ? 'selected' : '' }}>User</option>
                                            <option value="Client" {{ $user->user_role == 'Client' ? 'selected' : '' }}>Client</option>
                                        </select>
                                    </td>
                                    <td>
                                        <span class="display-field" data-field="start_work">{{ $user->start_work ? \Carbon\Carbon::parse($user->start_work)->format('d/m/Y') : '-' }}</span>
                                        <input type="date" class="form-control edit-field" value="{{ $user->start_work ? \Carbon\Carbon::parse($user->start_work)->format('Y-m-d') : '' }}" style="display: none;" data-field="start_work">
                                    </td>
                                    <td>
                                        <span class="display-field" data-field="birthday">{{ $user->birthday ? \Carbon\Carbon::parse($user->birthday)->format('d/m/Y') : '-' }}</span>
                                        <input type="date" class="form-control edit-field" value="{{ $user->birthday ? \Carbon\Carbon::parse($user->birthday)->format('Y-m-d') : '' }}" style="display: none;" data-field="birthday">
                                    </td>
                                    <td>
                                        <div class="action-buttons">
                                            <button class="btn btn-sm btn-primary edit-btn" onclick="editUser({{ $index }})" style="display: none;">
                                                <i class="ri-edit-line"></i>
                                            </button>
                                            <button class="btn btn-sm btn-success save-btn" onclick="saveUser({{ $index }})" style="display: none;">
                                                <i class="ri-save-line"></i>
                                            </button>
                                            <button class="btn btn-sm btn-secondary cancel-btn" onclick="cancelEdit({{ $index }})" style="display: none;">
                                                <i class="ri-close-line"></i>
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Additional Info Card -->
    <div class="grid grid-cols-1 lg:grid-cols-3 gap-6 mt-6">
        <div class="col-span-1">
            <div class="card border-0 overflow-hidden">
                <div class="card-body text-center">
                    <div class="w-16 h-16 bg-primary-100 dark:bg-primary-900 rounded-full flex items-center justify-center mx-auto mb-4">
                        <iconify-icon icon="heroicons:users" class="text-2xl text-primary-600 dark:text-primary-400"></iconify-icon>
                    </div>
                    <h6 class="text-lg font-semibold mb-2">Total Users</h6>
                    <p class="text-2xl font-bold text-primary-600 dark:text-primary-400">{{ count($users) }}</p>
                </div>
            </div>
        </div>
        
        <div class="col-span-1">
            <div class="card border-0 overflow-hidden">
                <div class="card-body text-center">
                    <div class="w-16 h-16 bg-success-100 dark:bg-success-900 rounded-full flex items-center justify-center mx-auto mb-4">
                        <iconify-icon icon="heroicons:star" class="text-2xl text-success-600 dark:text-success-400"></iconify-icon>
                    </div>
                    <h6 class="text-lg font-semibold mb-2">Active Users</h6>
                    <p class="text-2xl font-bold text-success-600 dark:text-success-400">{{ count($users) }}</p>
                </div>
            </div>
        </div>
        
        <div class="col-span-1">
            <div class="card border-0 overflow-hidden">
                <div class="card-body text-center">
                    <div class="w-16 h-16 bg-warning-100 dark:bg-warning-900 rounded-full flex items-center justify-center mx-auto mb-4">
                        <iconify-icon icon="heroicons:calendar" class="text-2xl text-warning-600 dark:text-warning-400"></iconify-icon>
                    </div>
                    <h6 class="text-lg font-semibold mb-2">Avg. Experience</h6>
                    <p class="text-2xl font-bold text-warning-600 dark:text-warning-400">7+ Years</p>
                </div>
            </div>
        </div>
    </div>


@endsection

@push('styles')
<style>
.user-row.editing {
    background-color: rgba(59, 130, 246, 0.1) !important;
    border-left: 4px solid #3b82f6;
}

.edit-field {
    font-size: 0.875rem;
    padding: 0.375rem 0.75rem;
    border: 1px solid #d1d5db;
    border-radius: 0.375rem;
    background-color: white;
    color: #374151;
}

.dark .edit-field {
    background-color: #374151;
    border-color: #4b5563;
    color: #f9fafb;
}

.bulk-actions {
    animation: fadeIn 0.3s ease-in-out;
}

@keyframes fadeIn {
    from { opacity: 0; transform: translateY(-10px); }
    to { opacity: 1; transform: translateY(0); }
}

.form-check-input {
    width: 1.25rem;
    height: 1.25rem;
    cursor: pointer;
}

.form-check-input:checked {
    background-color: #3b82f6;
    border-color: #3b82f6;
}

/* Excel-like highlighting */
.excel-highlight {
    background-color: #3b82f6 !important;
    color: white !important;
    box-shadow: 0 0 0 2px #1d4ed8 !important;
    outline: none !important;
}

.excel-highlight::placeholder {
    color: rgba(255, 255, 255, 0.7) !important;
}

/* Focus styles for better visibility */
.edit-field:focus {
    border-color: #3b82f6 !important;
    box-shadow: 0 0 0 2px rgba(59, 130, 246, 0.2) !important;
    outline: none !important;
}

/* Instructions for keyboard shortcuts */
.keyboard-instructions {
    background-color: #f8fafc;
    border: 1px solid #e2e8f0;
    border-radius: 0.5rem;
    padding: 1rem;
    margin-bottom: 1rem;
    font-size: 0.875rem;
    color: #64748b;
}

.keyboard-instructions h6 {
    color: #1e293b;
    font-weight: 600;
    margin-bottom: 0.5rem;
}

.keyboard-instructions ul {
    margin: 0;
    padding-left: 1.5rem;
}

.keyboard-instructions li {
    margin-bottom: 0.25rem;
}
</style>
@endpush

