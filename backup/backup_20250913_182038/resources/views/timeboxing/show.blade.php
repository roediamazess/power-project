@extends('layout.layout')
@php
    $title='Time Boxing Details';
    $subTitle = 'View Time Boxing Session';
@endphp

@section('content')

<div class="grid grid-cols-1 xl:grid-cols-12 gap-6">
    <div class="col-span-12">
        <div class="card h-full">
            <div class="card-header">
                <div class="flex justify-between items-center">
                    <div>
                        <h5 class="card-title">{{ $timeBoxing->title }}</h5>
                        <p class="text-sm text-muted mb-0">Time Boxing Session Details</p>
                    </div>
                    <div class="flex space-x-2">
                        <a href="{{ route('timeboxing.edit', $timeBoxing) }}" class="btn btn-primary">
                            <i class="ri-edit-line me-1"></i> Edit
                        </a>
                        <a href="{{ route('timeboxing.index') }}" class="btn btn-secondary">
                            <i class="ri-arrow-left-line me-1"></i> Back
                        </a>
                    </div>
                </div>
            </div>

            <div class="card-body">
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                    <!-- Basic Information -->
                    <div class="lg:col-span-2">
                        <h6 class="text-lg font-semibold text-gray-900 dark:text-white mb-4">Session Information</h6>
                        
                        <div class="space-y-4">
                            <!-- Title -->
                            <div>
                                <label class="text-sm font-medium text-gray-500 dark:text-gray-400">Title</label>
                                <p class="text-sm text-gray-900 dark:text-white">{{ $timeBoxing->title }}</p>
                            </div>

                            <!-- Description -->
                            @if($timeBoxing->description)
                                <div>
                                    <label class="text-sm font-medium text-gray-500 dark:text-gray-400">Description</label>
                                    <p class="text-sm text-gray-900 dark:text-white">{{ $timeBoxing->description }}</p>
                                </div>
                            @endif

                            <!-- Notes -->
                            @if($timeBoxing->notes)
                                <div>
                                    <label class="text-sm font-medium text-gray-500 dark:text-gray-400">Notes</label>
                                    <p class="text-sm text-gray-900 dark:text-white">{{ $timeBoxing->notes }}</p>
                                </div>
                            @endif
                        </div>
                    </div>

                    <!-- Status & Priority -->
                    <div>
                        <h6 class="text-lg font-semibold text-gray-900 dark:text-white mb-4">Status & Priority</h6>
                        
                        <div class="space-y-4">
                            <!-- Status -->
                            <div>
                                <label class="text-sm font-medium text-gray-500 dark:text-gray-400">Status</label>
                                <div class="mt-1">
                                    <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium {{ $timeBoxing->status_badge_class }}">
                                        {{ ucfirst(str_replace('_', ' ', $timeBoxing->status)) }}
                                    </span>
                                </div>
                            </div>

                            <!-- Priority -->
                            <div>
                                <label class="text-sm font-medium text-gray-500 dark:text-gray-400">Priority</label>
                                <div class="mt-1">
                                    <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium {{ $timeBoxing->priority_badge_class }}">
                                        {{ ucfirst($timeBoxing->priority) }}
                                    </span>
                                </div>
                            </div>

                            <!-- Category -->
                            <div>
                                <label class="text-sm font-medium text-gray-500 dark:text-gray-400">Category</label>
                                <p class="text-sm text-gray-900 dark:text-white">{{ $timeBoxing->category ?? 'Uncategorized' }}</p>
                            </div>
                        </div>
                    </div>

                    <!-- Time Information -->
                    <div class="lg:col-span-2">
                        <h6 class="text-lg font-semibold text-gray-900 dark:text-white mb-4">Time Information</h6>
                        
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                            <!-- Duration -->
                            <div>
                                <label class="text-sm font-medium text-gray-500 dark:text-gray-400">Duration</label>
                                <p class="text-sm text-gray-900 dark:text-white">{{ $timeBoxing->formatted_duration }}</p>
                            </div>

                            <!-- Start Time -->
                            <div>
                                <label class="text-sm font-medium text-gray-500 dark:text-gray-400">Start Time</label>
                                <p class="text-sm text-gray-900 dark:text-white">
                                    {{ $timeBoxing->start_time ? $timeBoxing->start_time->format('M d, Y H:i') : 'Not started' }}
                                </p>
                            </div>

                            <!-- End Time -->
                            <div>
                                <label class="text-sm font-medium text-gray-500 dark:text-gray-400">End Time</label>
                                <p class="text-sm text-gray-900 dark:text-white">
                                    {{ $timeBoxing->end_time ? $timeBoxing->end_time->format('M d, Y H:i') : 'Not completed' }}
                                </p>
                            </div>

                            <!-- Created At -->
                            <div>
                                <label class="text-sm font-medium text-gray-500 dark:text-gray-400">Created</label>
                                <p class="text-sm text-gray-900 dark:text-white">
                                    {{ $timeBoxing->created_at->format('M d, Y H:i') }}
                                </p>
                            </div>
                        </div>
                    </div>

                    <!-- Actions -->
                    <div>
                        <h6 class="text-lg font-semibold text-gray-900 dark:text-white mb-4">Quick Actions</h6>
                        
                        <div class="space-y-3">
                            <!-- Start Session -->
                            @if($timeBoxing->status === 'planned')
                                <form action="{{ route('timeboxing.start', $timeBoxing) }}" method="POST" class="w-full">
                                    @csrf
                                    <button type="submit" class="w-full btn btn-success">
                                        <i class="ri-play-circle-line me-1"></i> Start Session
                                    </button>
                                </form>
                            @endif

                            <!-- Complete Session -->
                            @if($timeBoxing->status === 'in_progress')
                                <form action="{{ route('timeboxing.complete', $timeBoxing) }}" method="POST" class="w-full">
                                    @csrf
                                    <button type="submit" class="w-full btn btn-primary">
                                        <i class="ri-check-circle-line me-1"></i> Complete Session
                                    </button>
                                </form>
                            @endif

                            <!-- Cancel Session -->
                            @if(in_array($timeBoxing->status, ['planned', 'in_progress']))
                                <form action="{{ route('timeboxing.cancel', $timeBoxing) }}" method="POST" class="w-full">
                                    @csrf
                                    <button type="submit" class="w-full btn btn-danger">
                                        <i class="ri-close-circle-line me-1"></i> Cancel Session
                                    </button>
                                </form>
                            @endif

                            <!-- Edit Session -->
                            <a href="{{ route('timeboxing.edit', $timeBoxing) }}" class="w-full btn btn-outline-primary">
                                <i class="ri-edit-line me-1"></i> Edit Session
                            </a>

                            <!-- Delete Session -->
                            <button onclick="confirmDelete({{ $timeBoxing->id }})" class="w-full btn btn-outline-danger">
                                <i class="ri-delete-bin-line me-1"></i> Delete Session
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Delete Confirmation Modal -->
<div id="deleteModal" class="fixed inset-0 bg-gray-600 bg-opacity-50 overflow-y-auto h-full w-full hidden z-50">
    <div class="relative top-20 mx-auto p-5 border w-96 shadow-lg rounded-md bg-white dark:bg-gray-800">
        <div class="mt-3 text-center">
            <div class="mx-auto flex items-center justify-center h-12 w-12 rounded-full bg-red-100 dark:bg-red-900">
                <i class="ri-delete-bin-line text-red-600 dark:text-red-400 text-xl"></i>
            </div>
            <h3 class="text-lg font-medium text-gray-900 dark:text-white mt-4">Delete Time Boxing Session</h3>
            <div class="mt-2 px-7 py-3">
                <p class="text-sm text-gray-500 dark:text-gray-400">
                    Are you sure you want to delete this time boxing session? This action cannot be undone.
                </p>
            </div>
            <div class="items-center px-4 py-3">
                <button id="confirm-delete-btn" class="px-4 py-2 bg-red-600 dark:bg-red-700 text-white dark:text-white rounded-md hover:bg-red-700 dark:hover:bg-red-600 focus:outline-none border border-red-500 dark:border-red-600">
                    Yes, Delete (Y)
                </button>
                <button id="cancel-delete-btn" class="ml-3 px-4 py-2 bg-gray-300 dark:bg-gray-600 text-gray-800 dark:text-gray-200 rounded-md hover:bg-gray-400 dark:hover:bg-gray-500 focus:outline-none">
                    Cancel (N)
                </button>
            </div>
        </div>
    </div>
</div>

<!-- Hidden Delete Form -->
<form id="delete-form" method="POST" style="display: none;">
    @csrf
    @method('DELETE')
</form>

@endsection

@push('scripts')
<script>
let deleteId = null;

function confirmDelete(id) {
    deleteId = id;
    document.getElementById('deleteModal').classList.remove('hidden');
}

function deleteTimeBoxing() {
    if (deleteId) {
        const form = document.getElementById('delete-form');
        form.action = `/timeboxing/${deleteId}`;
        form.submit();
    }
}

function cancelDelete() {
    deleteId = null;
    document.getElementById('deleteModal').classList.add('hidden');
}

// Event listeners
document.getElementById('confirm-delete-btn').addEventListener('click', deleteTimeBoxing);
document.getElementById('cancel-delete-btn').addEventListener('click', cancelDelete);

// Close modal when clicking outside
document.getElementById('deleteModal').addEventListener('click', function(e) {
    if (e.target === this) {
        cancelDelete();
    }
});

// Keyboard shortcuts
document.addEventListener('keydown', function(e) {
    if (e.key === 'Escape') {
        cancelDelete();
    } else if (e.key === 'y' || e.key === 'Y') {
        if (deleteId && !document.getElementById('deleteModal').classList.contains('hidden')) {
            deleteTimeBoxing();
        }
    } else if (e.key === 'n' || e.key === 'N') {
        if (deleteId && !document.getElementById('deleteModal').classList.contains('hidden')) {
            cancelDelete();
        }
    }
});
</script>
@endpush
