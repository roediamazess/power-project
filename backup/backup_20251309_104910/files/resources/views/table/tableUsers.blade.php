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
                    <div class="flex justify-between items-center mb-6">
                        <div class="flex-1">
                            <!-- Search Input -->
                            <div class="relative max-w-md">
                                <input type="text" 
                                       id="userSearchInput" 
                                       placeholder="Search users..." 
                                       class="w-full px-4 py-3 pr-10 text-sm border border-gray-200 dark:border-gray-600 rounded-xl bg-white dark:bg-gray-800 text-gray-900 dark:text-white placeholder-gray-400 dark:placeholder-gray-500 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition-all duration-200 shadow-sm">
                                <button id="clearSearchBtn" 
                                        class="absolute inset-y-0 right-0 pr-3 flex items-center text-gray-400 hover:text-gray-600 dark:hover:text-gray-300 transition-colors duration-200 hidden">
                                    <iconify-icon icon="heroicons:x-mark" class="h-4 w-4"></iconify-icon>
                                </button>
                            </div>
                            <div id="searchResults" class="mt-2 text-xs text-gray-500 dark:text-gray-400 hidden">
                                <span id="searchCount">0</span> users found
                            </div>
                        </div>
                        <div class="bulk-actions">
                            <!-- Bulk actions removed - using modal edit instead -->
                        </div>
                    </div>
                </div>
                
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table-users-clean w-full">
                            <thead>
                                <tr>
                                    <th class="!rounded-s-none">#</th>
                                    <th>Display Name</th>
                                    <th>Full Name</th>
                                    <th>Email</th>
                                    <th>Password</th>
                                    <th class="text-center">Tier</th>
                                    <th class="text-center">User Role</th>
                                    <th>Start Work</th>
                                    <th>Birthday</th>
                                    <th class="!rounded-e-none">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($users as $index => $user)
                                <tr id="user-row-{{ $index }}" class="user-row" data-user-id="{{ $user->id }}" data-user-email="{{ $user->email }}">
                                    <td class="fw-semibold">{{ $index + 1 }}</td>
                                    <td>
                                        <span class="fw-semibold text-muted">{{ $user->display_name }}</span>
                                        <small class="text-muted d-block">(Read Only)</small>
                                    </td>
                                    <td>
                                        <span class="text-gray-900 dark:text-white">{{ $user->full_name }}</span>
                                    </td>
                                    <td>
                                        <span class="text-muted">
                                            <a href="mailto:{{ $user->email }}" class="text-primary-600 dark:text-primary-400 hover:underline">
                                                {{ $user->email }}
                                            </a>
                                        </span>
                                    </td>
                                    <td>
                                        <span class="text-muted text-sm">••••••••</span>
                                    </td>
                                    <td class="text-center">
                                        <span class="badge bg-success-100 text-success-600 dark:bg-success-900 dark:text-success-400 px-2 py-1 rounded">
                                            {{ $user->tier }}
                                        </span>
                                    </td>
                                    <td class="text-center">
                                        <span class="badge bg-info-100 text-info-600 dark:bg-info-900 dark:text-info-400 px-2 py-1 rounded">
                                            {{ $user->user_role }}
                                        </span>
                                    </td>
                                    <td>
                                        <span class="text-gray-900 dark:text-white">{{ $user->start_work ? \Carbon\Carbon::parse($user->start_work)->format('d/m/Y') : '-' }}</span>
                                    </td>
                                    <td>
                                        <span class="text-gray-900 dark:text-white">{{ $user->birthday ? \Carbon\Carbon::parse($user->birthday)->format('d/m/Y') : '-' }}</span>
                                    </td>
                                    <td>
                                        <div class="action-buttons">
                                            <!-- Modal Edit Button -->
                                            <button class="btn btn-sm btn-info" onclick="openEditModal({{ $index }})" title="Edit User">
                                                <i class="ri-edit-box-line"></i> Edit
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

    <!-- Edit User Modal -->
    <div id="editUserModal" class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50" style="display: none;">
        <div class="bg-white dark:bg-gray-800 rounded-lg shadow-xl w-full max-w-2xl mx-4 max-h-[90vh] overflow-y-auto">
            <!-- Modal Header -->
            <div class="flex items-center justify-between p-6 border-b border-gray-200 dark:border-gray-700">
                <h3 class="text-lg font-semibold text-gray-900 dark:text-white">
                    <i class="ri-edit-line mr-2"></i>Edit User
                </h3>
                <button onclick="closeEditModal()" class="text-gray-400 hover:text-gray-600 dark:hover:text-gray-300">
                    <i class="ri-close-line text-xl"></i>
                </button>
            </div>

            <!-- Modal Body -->
            <div class="p-6">
                <form id="editUserForm" class="space-y-6">
                    <input type="hidden" id="editUserId" name="id">

                    <!-- Display Name (Read Only) -->
                    <div>
                        <label class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                            Display Name
                        </label>
                        <input type="text" id="editDisplayName" name="display_name"
                               class="w-full px-3 py-2 border border-gray-300 dark:border-gray-600 rounded-lg bg-gray-50 dark:bg-gray-700 text-gray-500 dark:text-gray-400 cursor-not-allowed"
                               readonly>
                        <p class="text-xs text-gray-500 dark:text-gray-400 mt-1">Display name cannot be changed</p>
                    </div>

                    <!-- Full Name -->
                    <div>
                        <label class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                            Full Name *
                        </label>
                        <input type="text" id="editFullName" name="full_name"
                               class="w-full px-3 py-2 border border-gray-300 dark:border-gray-600 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:text-white"
                               placeholder="Enter full name" required>
                    </div>

                    <!-- Email (Read Only) -->
                    <div>
                        <label class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                            Email Address
                        </label>
                        <input type="email" id="editEmail" name="email"
                               class="w-full px-3 py-2 border border-gray-300 dark:border-gray-600 rounded-lg bg-gray-50 dark:bg-gray-700 text-gray-500 dark:text-gray-400 cursor-not-allowed"
                               readonly>
                        <p class="text-xs text-gray-500 dark:text-gray-400 mt-1">Email address cannot be changed</p>
                    </div>

                    <!-- Password -->
                    <div>
                        <label class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                            New Password
                        </label>
                        <input type="password" id="editPassword" name="password"
                               class="w-full px-3 py-2 border border-gray-300 dark:border-gray-600 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:text-white"
                               placeholder="Leave empty to keep current password">
                        <p class="text-xs text-gray-500 dark:text-gray-400 mt-1">Leave empty if you don't want to change the password</p>
                    </div>

                    <!-- Tier -->
                    <div>
                        <label class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                            Tier *
                        </label>
                        <select id="editTier" name="tier"
                                class="w-full px-3 py-2 border border-gray-300 dark:border-gray-600 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:text-white" required>
                            <option value="New Born">New Born</option>
                            <option value="Tier 1">Tier 1</option>
                            <option value="Tier 2">Tier 2</option>
                            <option value="Tier 3">Tier 3</option>
                        </select>
                    </div>

                    <!-- User Role -->
                    <div>
                        <label class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                            User Role *
                        </label>
                        <select id="editUserRole" name="user_role"
                                class="w-full px-3 py-2 border border-gray-300 dark:border-gray-600 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:text-white" required>
                            <option value="Administrator">Administrator</option>
                            <option value="Admin Officer">Admin Officer</option>
                            <option value="User">User</option>
                            <option value="Client">Client</option>
                        </select>
                    </div>

                    <!-- Start Work Date -->
                    <div>
                        <label class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                            Start Work Date
                        </label>
                        <input type="date" id="editStartWork" name="start_work"
                               class="w-full px-3 py-2 border border-gray-300 dark:border-gray-600 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:text-white">
                    </div>

                    <!-- Birthday -->
                    <div>
                        <label class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                            Birthday
                        </label>
                        <input type="date" id="editBirthday" name="birthday"
                               class="w-full px-3 py-2 border border-gray-300 dark:border-gray-600 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:text-white">
                    </div>
                </form>
            </div>

            <!-- Modal Footer -->
            <div class="flex items-center justify-end gap-3 p-6 border-t border-gray-200 dark:border-gray-700">
                <button onclick="saveUserModal()"
                        class="px-4 py-2 text-sm font-medium text-white bg-blue-600 hover:bg-blue-700 rounded-lg transition-colors">
                    <i class="ri-save-line mr-2"></i>Save
                </button>
                <button onclick="closeEditModal()"
                        class="px-4 py-2 text-sm font-medium text-gray-700 dark:text-gray-300 bg-gray-100 dark:bg-gray-700 hover:bg-gray-200 dark:hover:bg-gray-600 rounded-lg transition-colors">
                    Cancel
                </button>
            </div>
        </div>
    </div>

@endsection

@push('styles')
<style>
/* Clean table styling */
.table-users-clean {
    border-collapse: separate;
    border-spacing: 0;
}

.table-users-clean th {
    background-color: #f8fafc;
    border-bottom: 2px solid #e2e8f0;
    font-weight: 600;
    color: #374151;
    padding: 1rem;
    text-align: left;
}

.dark .table-users-clean th {
    background-color: #1f2937;
    border-bottom-color: #374151;
    color: #f9fafb;
}

.table-users-clean td {
    padding: 1rem;
    border-bottom: 1px solid #e5e7eb;
    vertical-align: middle;
}

.dark .table-users-clean td {
    border-bottom-color: #374151;
}

.table-users-clean tbody tr:hover {
    background-color: #f9fafb;
}

.dark .table-users-clean tbody tr:hover {
    background-color: #111827;
}

/* Table Column Alignment */
.table-users-clean th.text-center,
.table-users-clean td.text-center {
    text-align: center;
}

/* Badge Centering */
.table-users-clean td.text-center .badge {
    display: inline-block;
    margin: 0 auto;
}

/* Search Input Styling */
#userSearchInput {
    transition: all 0.2s ease;
}

#userSearchInput:focus {
    transform: translateY(-1px);
    box-shadow: 0 8px 25px rgba(59, 130, 246, 0.15);
}

#userSearchInput::placeholder {
    font-weight: 400;
}

/* Clear button positioning */
.relative .absolute.inset-y-0.right-0 {
    z-index: 20;
    pointer-events: auto;
}

#clearSearchBtn {
    transition: all 0.2s ease;
}

#clearSearchBtn:hover {
    transform: scale(1.05);
    color: #ef4444;
}

#searchResults {
    font-weight: 500;
}

/* Search Results Animation */
.user-row {
    transition: all 0.3s ease;
}

.user-row[style*="display: none"] {
    opacity: 0;
    transform: translateX(-10px);
}

/* Search Highlight Effect */
.user-row.search-highlight {
    background-color: rgba(59, 130, 246, 0.03) !important;
    border-left: 2px solid #3b82f6;
    box-shadow: 0 2px 4px rgba(59, 130, 246, 0.1);
}

.dark .user-row.search-highlight {
    background-color: rgba(59, 130, 246, 0.08) !important;
    box-shadow: 0 2px 4px rgba(59, 130, 246, 0.15);
}

/* Modal Styles */
.modal-overlay {
    backdrop-filter: blur(4px);
}

.modal-content {
    animation: modalSlideIn 0.3s ease-out;
}

@keyframes modalSlideIn {
    from {
        opacity: 0;
        transform: translateY(-20px) scale(0.95);
    }
    to {
        opacity: 1;
        transform: translateY(0) scale(1);
    }
}

.modal-content.closing {
    animation: modalSlideOut 0.2s ease-in forwards;
}

@keyframes modalSlideOut {
    from {
        opacity: 1;
        transform: translateY(0) scale(1);
    }
    to {
        opacity: 0;
        transform: translateY(-20px) scale(0.95);
    }
}
</style>
@endpush

@push('scripts')
<script>
// Search Functionality
document.addEventListener('DOMContentLoaded', function() {
    const searchInput = document.getElementById('userSearchInput');
    const clearBtn = document.getElementById('clearSearchBtn');
    const userRows = document.querySelectorAll('.user-row');
    const searchResults = document.getElementById('searchResults');
    const searchCount = document.getElementById('searchCount');
    
    // Search function
    function performSearch() {
        const searchTerm = searchInput.value.toLowerCase().trim();
        let visibleCount = 0;
        
        userRows.forEach((row, index) => {
            const displayName = row.querySelector('td:nth-child(2) span')?.textContent?.toLowerCase() || '';
            const fullName = row.querySelector('td:nth-child(3) span')?.textContent?.toLowerCase() || '';
            const email = row.querySelector('td:nth-child(4) a')?.textContent?.toLowerCase() || '';
            const tier = row.querySelector('td:nth-child(6) span')?.textContent?.toLowerCase() || '';
            const userRole = row.querySelector('td:nth-child(7) span')?.textContent?.toLowerCase() || '';
            
            const searchableText = `${displayName} ${fullName} ${email} ${tier} ${userRole}`;
            
            if (searchTerm === '' || searchableText.includes(searchTerm)) {
                row.style.display = '';
                visibleCount++;
                
                // Add highlight effect for search term
                if (searchTerm !== '') {
                    row.classList.add('search-highlight');
                } else {
                    row.classList.remove('search-highlight');
                }
            } else {
                row.style.display = 'none';
                row.classList.remove('search-highlight');
            }
        });
        
        // Show/hide clear button and search results
        if (searchTerm !== '') {
            clearBtn.classList.remove('hidden');
            searchResults.classList.remove('hidden');
            searchCount.textContent = visibleCount;
        } else {
            clearBtn.classList.add('hidden');
            searchResults.classList.add('hidden');
        }
        
        // Update row numbers for visible rows
        let visibleIndex = 1;
        userRows.forEach((row) => {
            if (row.style.display !== 'none') {
                const numberCell = row.querySelector('td:first-child');
                if (numberCell) {
                    numberCell.textContent = visibleIndex;
                    visibleIndex++;
                }
            }
        });
    }
    
    // Event listeners
    searchInput.addEventListener('input', performSearch);
    searchInput.addEventListener('keyup', function(e) {
        if (e.key === 'Escape') {
            searchInput.value = '';
            performSearch();
            searchInput.blur();
        }
    });
    
    clearBtn.addEventListener('click', function() {
        searchInput.value = '';
        performSearch();
        searchInput.focus();
    });
    
    // Initial search to set up row numbers
    performSearch();
});

// Modal Functions
function openEditModal(rowIndex) {
    // Find user data from the table using row index
    const userRow = document.querySelector(`#user-row-${rowIndex}`);
    if (!userRow) return;

    // Get actual user ID from data attribute
    const userId = userRow.getAttribute('data-user-id');
    const userEmail = userRow.getAttribute('data-user-email');

    // Get user data from table cells
    const displayName = userRow.querySelector('td:nth-child(2) span')?.textContent?.trim() || '';
    const fullName = userRow.querySelector('td:nth-child(3) span')?.textContent?.trim() || '';
    const email = userRow.querySelector('td:nth-child(4) a')?.textContent?.trim() || '';
    const tier = userRow.querySelector('td:nth-child(6) span')?.textContent?.trim() || '';
    const userRole = userRow.querySelector('td:nth-child(7) span')?.textContent?.trim() || '';

    // Get date values and convert format
    const startWorkText = userRow.querySelector('td:nth-child(8) span')?.textContent?.trim() || '';
    const birthdayText = userRow.querySelector('td:nth-child(9) span')?.textContent?.trim() || '';

    const startWork = startWorkText && startWorkText !== '-' ? convertDateFormat(startWorkText) : '';
    const birthday = birthdayText && birthdayText !== '-' ? convertDateFormat(birthdayText) : '';

    // Populate modal form with actual user ID
    document.getElementById('editUserId').value = userId;
    document.getElementById('editDisplayName').value = displayName;
    document.getElementById('editFullName').value = fullName;
    document.getElementById('editEmail').value = email;
    document.getElementById('editPassword').value = '';
    document.getElementById('editTier').value = tier;
    document.getElementById('editUserRole').value = userRole;
    document.getElementById('editStartWork').value = startWork;
    document.getElementById('editBirthday').value = birthday;

    // Show modal
    const modal = document.getElementById('editUserModal');
    modal.style.display = 'flex';
    document.body.style.overflow = 'hidden';

    // Focus on first editable field
    setTimeout(() => {
        document.getElementById('editFullName').focus();
    }, 100);
}

function closeEditModal() {
    const modal = document.getElementById('editUserModal');
    modal.style.display = 'none';
    document.body.style.overflow = '';
}

function saveUserModal() {
    const form = document.getElementById('editUserForm');
    const formData = new FormData(form);

    // Validate required fields
    const fullName = formData.get('full_name')?.trim();
    const tier = formData.get('tier');
    const userRole = formData.get('user_role');

    if (!fullName || !tier || !userRole) {
        showNotification('Please fill in all required fields (Full Name, Tier, User Role)', 'error');
        return;
    }

    // Show loading state
    const saveBtn = document.querySelector('#editUserModal button[onclick="saveUserModal()"]');
    const originalText = saveBtn.innerHTML;
    saveBtn.innerHTML = '<i class="ri-loader-4-line animate-spin mr-2"></i>Saving...';
    saveBtn.disabled = true;

    // Prepare data for API
    const userData = {
        id: formData.get('id'),
        full_name: fullName,
        tier: tier,
        user_role: userRole,
        start_work: formData.get('start_work') || null,
        birthday: formData.get('birthday') || null
    };

    // Add password only if provided
    const password = formData.get('password')?.trim();
    if (password) {
        userData.password = password;
    }

    // Debug: Log the data being sent
    console.log('Sending user data:', userData);

    // Send to API
    fetch('/api/update-user', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]')?.getAttribute('content') || ''
        },
        body: JSON.stringify(userData)
    })
    .then(response => {
        console.log('Response status:', response.status);
        return response.json();
    })
    .then(data => {
        console.log('Response data:', data);
        if (data.success) {
            showNotification('User updated successfully!', 'success');
            closeEditModal();
            setTimeout(() => window.location.reload(), 1000);
        } else {
            throw new Error(data.message || 'Failed to update user');
        }
    })
    .catch(error => {
        console.error('Error:', error);
        showNotification('Failed to update user: ' + error.message, 'error');
    })
    .finally(() => {
        saveBtn.innerHTML = originalText;
        saveBtn.disabled = false;
    });
}

// Utility Functions
function convertDateFormat(dateString) {
    if (!dateString || dateString === '-') return '';
    const parts = dateString.split('/');
    if (parts.length === 3) {
        return `${parts[2]}-${parts[1].padStart(2, '0')}-${parts[0].padStart(2, '0')}`;
    }
    return dateString;
}

function showNotification(message, type = 'info') {
    const notification = document.createElement('div');
    notification.className = `fixed top-4 right-4 z-50 p-4 rounded-lg shadow-lg max-w-sm ${
        type === 'success' ? 'bg-green-500 text-white' :
        type === 'error' ? 'bg-red-500 text-white' :
        'bg-blue-500 text-white'
    }`;
    notification.innerHTML = `
        <div class="flex items-center">
            <i class="ri-${type === 'success' ? 'check' : type === 'error' ? 'error-warning' : 'information'}-line mr-2"></i>
            <span>${message}</span>
        </div>
    `;

    document.body.appendChild(notification);
    setTimeout(() => notification.remove(), 3000);
}

// Initialize when page loads
document.addEventListener('DOMContentLoaded', function() {
    // Close modal when clicking outside
    document.getElementById('editUserModal')?.addEventListener('click', function(e) {
        if (e.target === this) closeEditModal();
    });

    // Close modal on Escape key
    document.addEventListener('keydown', function(e) {
        if (e.key === 'Escape' && document.getElementById('editUserModal').style.display === 'flex') {
            closeEditModal();
        }
    });
});
</script>
@endpush

