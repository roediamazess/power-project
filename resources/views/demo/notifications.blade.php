@extends('layout.layout')
@php
    $title='Notification Demo';
    $subTitle = 'Test Notification System';
@endphp

@section('content')

<div class="grid grid-cols-1 xl:grid-cols-12 gap-6">
    <div class="col-span-12">
        <div class="card h-full p-0 border-0">
            <div class="card-body p-6">
                <div class="text-center mb-8">
                    <h1 class="text-3xl font-bold text-gray-900 dark:text-white mb-4">Notification System Demo</h1>
                    <p class="text-gray-600 dark:text-gray-400 mb-8">Test the notification system that appears from below the logo</p>
                </div>
                
                <!-- Enhanced Notification Test Buttons -->
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4 mb-8">
                    <button onclick="showNotification('Activity created successfully', 'create')" 
                            class="bg-purple-500 hover:bg-purple-600 text-white font-bold py-3 px-6 rounded-lg transition-transform transform hover:scale-105 shadow-md">
                        <i class="ri-add-line mr-2"></i>
                        Create Activity
                    </button>
                    
                    <button onclick="showNotification('Activity has been updated', 'update')" 
                            class="bg-cyan-500 hover:bg-cyan-600 text-white font-bold py-3 px-6 rounded-lg transition-transform transform hover:scale-105 shadow-md">
                        <i class="ri-edit-line mr-2"></i>
                        Update Activity
                    </button>
                    
                    <button onclick="showNotification('Activity has been cancelled', 'warning')" 
                            class="bg-yellow-500 hover:bg-yellow-600 text-white font-bold py-3 px-6 rounded-lg transition-transform transform hover:scale-105 shadow-md">
                        <i class="ri-alert-line mr-2"></i>
                        Cancel Activity
                    </button>
                    
                    <button onclick="showNotification('Activity has been deleted', 'delete')" 
                            class="bg-orange-500 hover:bg-orange-600 text-white font-bold py-3 px-6 rounded-lg transition-transform transform hover:scale-105 shadow-md">
                        <i class="ri-delete-bin-line mr-2"></i>
                        Delete Activity
                    </button>
                </div>
                
                <!-- New Enhanced Features -->
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4 mb-8">
                    <button onclick="showImportant('This is an important notification!', 'info')" 
                            class="bg-blue-500 hover:bg-blue-600 text-white font-bold py-3 px-6 rounded-lg transition-transform transform hover:scale-105 shadow-md">
                        <i class="ri-star-line mr-2"></i>
                        Important Notification
                    </button>
                    
                    <button onclick="showPersistent('This notification stays until clicked', 'warning')" 
                            class="bg-yellow-500 hover:bg-yellow-600 text-white font-bold py-3 px-6 rounded-lg transition-transform transform hover:scale-105 shadow-md">
                        <i class="ri-pin-line mr-2"></i>
                        Persistent Notification
                    </button>
                    
                    <button onclick="showQuick('Quick notification (2s)', 'success')" 
                            class="bg-green-500 hover:bg-green-600 text-white font-bold py-3 px-6 rounded-lg transition-transform transform hover:scale-105 shadow-md">
                        <i class="ri-flashlight-line mr-2"></i>
                        Quick Notification
                    </button>
                    
                    <button onclick="clearAllNotifications()" 
                            class="bg-red-500 hover:bg-red-600 text-white font-bold py-3 px-6 rounded-lg transition-transform transform hover:scale-105 shadow-md">
                        <i class="ri-delete-bin-2-line mr-2"></i>
                        Clear All
                    </button>
                </div>

                <!-- Additional Test Buttons -->
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4 mb-8">
                    <button onclick="showSuccess('Operation completed successfully')" 
                            class="bg-green-500 hover:bg-green-600 text-white font-bold py-3 px-6 rounded-lg transition-transform transform hover:scale-105 shadow-md">
                        <i class="ri-check-line mr-2"></i>
                        Success Message
                    </button>
                    
                    <button onclick="showError('An error occurred while processing')" 
                            class="bg-red-500 hover:bg-red-600 text-white font-bold py-3 px-6 rounded-lg transition-transform transform hover:scale-105 shadow-md">
                        <i class="ri-error-warning-line mr-2"></i>
                        Error Message
                    </button>
                    
                    <button onclick="showWarning('Please check your input data')" 
                            class="bg-yellow-500 hover:bg-yellow-600 text-white font-bold py-3 px-6 rounded-lg transition-transform transform hover:scale-105 shadow-md">
                        <i class="ri-alert-line mr-2"></i>
                        Warning Message
                    </button>
                    
                    <button onclick="showInfo('This is an informational message')" 
                            class="bg-blue-500 hover:bg-blue-600 text-white font-bold py-3 px-6 rounded-lg transition-transform transform hover:scale-105 shadow-md">
                        <i class="ri-information-line mr-2"></i>
                        Info Message
                    </button>
                </div>

                <!-- Role Management Test Buttons -->
                <div class="border-t pt-6">
                    <h3 class="text-lg font-semibold text-gray-900 dark:text-white mb-4">Role Management Notifications</h3>
                    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
                        <button onclick="showNotification('User role updated to Administrator', 'update')" 
                                class="bg-blue-500 hover:bg-blue-600 text-white font-bold py-3 px-6 rounded-lg transition-transform transform hover:scale-105 shadow-md">
                            <i class="ri-user-settings-line mr-2"></i>
                            Role Updated
                        </button>
                        
                        <button onclick="showNotification('New user created with role Management', 'create')" 
                                class="bg-purple-500 hover:bg-purple-600 text-white font-bold py-3 px-6 rounded-lg transition-transform transform hover:scale-105 shadow-md">
                            <i class="ri-user-add-line mr-2"></i>
                            User Created
                        </button>
                        
                        <button onclick="showNotification('User account has been deleted', 'delete')" 
                                class="bg-red-500 hover:bg-red-600 text-white font-bold py-3 px-6 rounded-lg transition-transform transform hover:scale-105 shadow-md">
                            <i class="ri-user-delete-line mr-2"></i>
                            User Deleted
                        </button>
                    </div>
                </div>

                <!-- Enhanced Notification Features -->
                <div class="border-t pt-6 mt-8">
                    <h3 class="text-lg font-semibold text-gray-900 dark:text-white mb-4">Enhanced Notification Features</h3>
                    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                        <div class="bg-gray-50 dark:bg-gray-800 p-4 rounded-lg">
                            <h4 class="font-medium text-gray-900 dark:text-white mb-2">Visual Features</h4>
                            <ul class="text-sm text-gray-600 dark:text-gray-400 space-y-1">
                                <li>• Appears from below floating nav</li>
                                <li>• Modern capsule design</li>
                                <li>• Color-coded by type</li>
                                <li>• Animated progress bar</li>
                                <li>• Smooth hover effects</li>
                                <li>• Click to dismiss</li>
                                <li>• Backdrop blur effect</li>
                                <li>• Gradient borders</li>
                            </ul>
                        </div>
                        
                        <div class="bg-gray-50 dark:bg-gray-800 p-4 rounded-lg">
                            <h4 class="font-medium text-gray-900 dark:text-white mb-2">Notification Types</h4>
                            <ul class="text-sm text-gray-600 dark:text-gray-400 space-y-1">
                                <li>• <span class="text-green-600">Success</span> - Green gradient</li>
                                <li>• <span class="text-red-600">Error</span> - Red gradient</li>
                                <li>• <span class="text-yellow-600">Warning</span> - Yellow gradient</li>
                                <li>• <span class="text-blue-600">Info</span> - Blue gradient</li>
                                <li>• <span class="text-purple-600">Create</span> - Purple gradient</li>
                                <li>• <span class="text-cyan-600">Update</span> - Cyan gradient</li>
                                <li>• <span class="text-orange-600">Delete</span> - Orange gradient</li>
                            </ul>
                        </div>
                        
                        <div class="bg-gray-50 dark:bg-gray-800 p-4 rounded-lg">
                            <h4 class="font-medium text-gray-900 dark:text-white mb-2">New Features</h4>
                            <ul class="text-sm text-gray-600 dark:text-gray-400 space-y-1">
                                <li>• <span class="text-blue-600">Important</span> - Pulsing glow effect</li>
                                <li>• <span class="text-yellow-600">Persistent</span> - Stays until clicked</li>
                                <li>• <span class="text-green-600">Quick</span> - 2 second duration</li>
                                <li>• <span class="text-red-600">Clear All</span> - Remove all notifications</li>
                                <li>• Auto-reposition on resize</li>
                                <li>• Multiple notification support</li>
                                <li>• Custom duration options</li>
                                <li>• Enhanced animations</li>
                            </ul>
                        </div>
                    </div>
                </div>

                <!-- Advanced Usage Examples -->
                <div class="border-t pt-6 mt-8">
                    <h3 class="text-lg font-semibold text-gray-900 dark:text-white mb-4">Advanced Usage Examples</h3>
                    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
                        <button onclick="showNotification('Custom 3s duration', 'info', {duration: 3000})" 
                                class="bg-blue-500 hover:bg-blue-600 text-white font-bold py-3 px-6 rounded-lg transition-transform transform hover:scale-105 shadow-md">
                            3 Second Duration
                        </button>
                        
                        <button onclick="showNotification('Custom 10s duration', 'warning', {duration: 10000})" 
                                class="bg-yellow-500 hover:bg-yellow-600 text-white font-bold py-3 px-6 rounded-lg transition-transform transform hover:scale-105 shadow-md">
                            10 Second Duration
                        </button>
                        
                        <button onclick="showNotification('No auto-close', 'error', {autoClose: false})" 
                                class="bg-red-500 hover:bg-red-600 text-white font-bold py-3 px-6 rounded-lg transition-transform transform hover:scale-105 shadow-md">
                            No Auto-close
                        </button>
                        
                        <button onclick="showNotification('Custom important', 'success', {important: true, duration: 8000})" 
                                class="bg-green-500 hover:bg-green-600 text-white font-bold py-3 px-6 rounded-lg transition-transform transform hover:scale-105 shadow-md">
                            Important Success
                        </button>
                    </div>
                </div>
                
                <!-- Multiple Notifications Test -->
                <div class="border-t pt-6 mt-8">
                    <h3 class="text-lg font-semibold text-gray-900 dark:text-white mb-4">Multiple Notifications Test</h3>
                    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
                        <button onclick="showMultipleNotifications()" 
                                class="bg-purple-500 hover:bg-purple-600 text-white font-bold py-3 px-6 rounded-lg transition-transform transform hover:scale-105 shadow-md">
                            <i class="ri-stack-line mr-2"></i>
                            Show Multiple
                        </button>
                        
                        <button onclick="showNotificationSequence()" 
                                class="bg-indigo-500 hover:bg-indigo-600 text-white font-bold py-3 px-6 rounded-lg transition-transform transform hover:scale-105 shadow-md">
                            <i class="ri-play-line mr-2"></i>
                            Show Sequence
                        </button>
                        
                        <button onclick="showNotification('Current count: ' + getNotificationCount(), 'info')" 
                                class="bg-gray-500 hover:bg-gray-600 text-white font-bold py-3 px-6 rounded-lg transition-transform transform hover:scale-105 shadow-md">
                            <i class="ri-information-line mr-2"></i>
                            Show Count
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

@endsection

@push('scripts')
<script>
// Demo functions for multiple notifications
function showMultipleNotifications() {
    const messages = [
        { msg: 'First notification', type: 'info' },
        { msg: 'Second notification', type: 'success' },
        { msg: 'Third notification', type: 'warning' },
        { msg: 'Fourth notification', type: 'error' }
    ];
    
    messages.forEach((item, index) => {
        setTimeout(() => {
            showNotification(item.msg, item.type);
        }, index * 500);
    });
}

function showNotificationSequence() {
    const sequence = [
        { msg: 'Step 1: Initializing...', type: 'info', duration: 2000 },
        { msg: 'Step 2: Processing data...', type: 'warning', duration: 3000 },
        { msg: 'Step 3: Almost done...', type: 'info', duration: 2000 },
        { msg: 'Step 4: Complete!', type: 'success', duration: 4000 }
    ];
    
    sequence.forEach((item, index) => {
        setTimeout(() => {
            showNotification(item.msg, item.type, { duration: item.duration });
        }, index * 1000);
    });
}

// Add some interactive features
document.addEventListener('DOMContentLoaded', function() {
    // Add notification counter display
    const counter = document.createElement('div');
    counter.id = 'notification-counter';
    counter.className = 'fixed top-4 right-4 bg-blue-500 text-white px-3 py-1 rounded-full text-sm font-medium z-50';
    counter.textContent = 'Notifications: 0';
    document.body.appendChild(counter);
    
    // Update counter when notifications change
    const originalShowNotification = window.showNotification;
    window.showNotification = function(...args) {
        originalShowNotification.apply(this, args);
        setTimeout(() => {
            const count = getNotificationCount();
            counter.textContent = `Notifications: ${count}`;
        }, 100);
    };
    
    const originalClearAll = window.clearAllNotifications;
    window.clearAllNotifications = function() {
        originalClearAll.apply(this, arguments);
        counter.textContent = 'Notifications: 0';
    };
});
</script>
@endpush
