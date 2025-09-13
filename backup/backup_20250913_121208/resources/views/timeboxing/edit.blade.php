@extends('layout.layout')
@php
    $title='Edit Time Boxing';
    $subTitle = 'Update Time Boxing Session';
@endphp

@section('content')

<div class="grid grid-cols-1 xl:grid-cols-12 gap-6">
    <div class="col-span-12">
        <div class="card h-full">
            <div class="card-header">
                <h5 class="card-title">Edit Time Boxing Session</h5>
                <p class="text-sm text-muted mb-0">Update your time boxing session details</p>
            </div>

            <div class="card-body">
                <!-- Success/Error Messages -->
                @if($errors->any())
                    <div class="alert alert-danger alert-dismissible fade show mb-4" role="alert">
                        <i class="ri-error-warning-line me-2"></i>
                        <strong>Please fix the following errors:</strong>
                        <ul class="mb-0 mt-2">
                            @foreach($errors->all() as $error)
                                <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                @endif

                <form action="{{ route('timeboxing.update', $timeBoxing) }}" method="POST">
                    @csrf
                    @method('PUT')
                    
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <!-- Title -->
                        <div class="md:col-span-2">
                            <label for="title" class="form-label">Title <span class="text-red-500">*</span></label>
                            <input type="text" class="form-control @error('title') is-invalid @enderror" 
                                   id="title" name="title" value="{{ old('title', $timeBoxing->title) }}" 
                                   placeholder="Enter session title" required>
                            @error('title')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                        <!-- Description -->
                        <div class="md:col-span-2">
                            <label for="description" class="form-label">Description</label>
                            <textarea class="form-control @error('description') is-invalid @enderror" 
                                      id="description" name="description" rows="3" 
                                      placeholder="Enter session description">{{ old('description', $timeBoxing->description) }}</textarea>
                            @error('description')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                        <!-- Duration -->
                        <div>
                            <label for="duration_minutes" class="form-label">Duration (minutes) <span class="text-red-500">*</span></label>
                            <input type="number" class="form-control @error('duration_minutes') is-invalid @enderror" 
                                   id="duration_minutes" name="duration_minutes" value="{{ old('duration_minutes', $timeBoxing->duration_minutes) }}" 
                                   min="1" max="480" placeholder="25" required>
                            <div class="form-text">Recommended: 25 minutes (Pomodoro technique)</div>
                            @error('duration_minutes')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                        <!-- Priority -->
                        <div>
                            <label for="priority" class="form-label">Priority <span class="text-red-500">*</span></label>
                            <select class="form-select @error('priority') is-invalid @enderror" 
                                    id="priority" name="priority" required>
                                <option value="">Select Priority</option>
                                <option value="low" {{ old('priority', $timeBoxing->priority) == 'low' ? 'selected' : '' }}>Low</option>
                                <option value="medium" {{ old('priority', $timeBoxing->priority) == 'medium' ? 'selected' : '' }}>Medium</option>
                                <option value="high" {{ old('priority', $timeBoxing->priority) == 'high' ? 'selected' : '' }}>High</option>
                            </select>
                            @error('priority')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                        <!-- Status -->
                        <div>
                            <label for="status" class="form-label">Status <span class="text-red-500">*</span></label>
                            <select class="form-select @error('status') is-invalid @enderror" 
                                    id="status" name="status" required>
                                <option value="">Select Status</option>
                                <option value="planned" {{ old('status', $timeBoxing->status) == 'planned' ? 'selected' : '' }}>Planned</option>
                                <option value="in_progress" {{ old('status', $timeBoxing->status) == 'in_progress' ? 'selected' : '' }}>In Progress</option>
                                <option value="completed" {{ old('status', $timeBoxing->status) == 'completed' ? 'selected' : '' }}>Completed</option>
                                <option value="cancelled" {{ old('status', $timeBoxing->status) == 'cancelled' ? 'selected' : '' }}>Cancelled</option>
                            </select>
                            @error('status')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                        <!-- Category -->
                        <div>
                            <label for="category" class="form-label">Category</label>
                            <input type="text" class="form-control @error('category') is-invalid @enderror" 
                                   id="category" name="category" value="{{ old('category', $timeBoxing->category) }}" 
                                   placeholder="e.g., Work, Study, Exercise">
                            @error('category')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                        <!-- Start Time -->
                        <div>
                            <label for="start_time" class="form-label">Start Time</label>
                            <input type="datetime-local" class="form-control @error('start_time') is-invalid @enderror" 
                                   id="start_time" name="start_time" 
                                   value="{{ old('start_time', $timeBoxing->start_time ? $timeBoxing->start_time->format('Y-m-d\TH:i') : '') }}">
                            @error('start_time')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                        <!-- End Time -->
                        <div>
                            <label for="end_time" class="form-label">End Time</label>
                            <input type="datetime-local" class="form-control @error('end_time') is-invalid @enderror" 
                                   id="end_time" name="end_time" 
                                   value="{{ old('end_time', $timeBoxing->end_time ? $timeBoxing->end_time->format('Y-m-d\TH:i') : '') }}">
                            @error('end_time')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                        <!-- Notes -->
                        <div class="md:col-span-2">
                            <label for="notes" class="form-label">Notes</label>
                            <textarea class="form-control @error('notes') is-invalid @enderror" 
                                      id="notes" name="notes" rows="3" 
                                      placeholder="Additional notes or reminders">{{ old('notes', $timeBoxing->notes) }}</textarea>
                            @error('notes')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>
                    </div>

                    <!-- Action Buttons -->
                    <div class="flex justify-end space-x-3 mt-6">
                        <a href="{{ route('timeboxing.index') }}" class="btn btn-secondary">
                            <i class="ri-arrow-left-line me-1"></i> Cancel
                        </a>
                        <button type="submit" class="btn btn-primary">
                            <i class="ri-save-line me-1"></i> Update Session
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

@endsection

@push('scripts')
<script>
// Auto-calculate end time based on duration and start time
document.getElementById('start_time').addEventListener('change', calculateEndTime);
document.getElementById('duration_minutes').addEventListener('change', calculateEndTime);

function calculateEndTime() {
    const startTime = document.getElementById('start_time').value;
    const duration = parseInt(document.getElementById('duration_minutes').value);
    
    if (startTime && duration) {
        const start = new Date(startTime);
        const end = new Date(start.getTime() + (duration * 60000));
        
        // Format to datetime-local format
        const endTime = end.toISOString().slice(0, 16);
        document.getElementById('end_time').value = endTime;
    }
}
</script>
@endpush
