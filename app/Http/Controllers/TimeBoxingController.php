<?php

namespace App\Http\Controllers;

use App\Models\TimeBoxing;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class TimeBoxingController extends Controller
{
    public function index()
    {
        return view('timeboxing.index');
    }

    // API endpoint to get all timeboxings with pagination
    public function getTimeBoxings(Request $request)
    {
        $perPage = $request->get('per_page', 10); // Default 10 items per page
        $page = $request->get('page', 1);
        $showAll = $request->get('show_all', false); // New parameter to show all timeboxings

        // Add logging to diagnose pagination issue
        $totalActivities = TimeBoxing::count();
        \Log::info('TimeBoxing API Request', [
            'requested_per_page' => $perPage,
            'requested_page' => $page,
            'show_all' => $showAll,
            'total_timeboxings_in_db' => $totalActivities,
            'timestamp' => now()
        ]);

        if ($showAll) {
            // Return all timeboxings without pagination
            $timeboxings = TimeBoxing::orderBy('no')->get();

            \Log::info('TimeBoxing API Response (All)', [
                'returned_count' => $timeboxings->count(),
                'total_available' => $totalActivities
            ]);

            return response()->json([
                'success' => true,
                'data' => $timeboxings,
                'pagination' => [
                    'current_page' => 1,
                    'last_page' => 1,
                    'per_page' => $totalActivities,
                    'total' => $totalActivities,
                    'from' => 1,
                    'to' => $totalActivities,
                    'has_more_pages' => false,
                    'next_page_url' => null,
                    'prev_page_url' => null,
                ]
            ]);
        }

        $timeboxings = TimeBoxing::orderBy('no')->paginate($perPage);

        \Log::info('TimeBoxing API Response (Paginated)', [
            'returned_count' => count($timeboxings->items()),
            'total_available' => $timeboxings->total(),
            'current_page' => $timeboxings->currentPage(),
            'last_page' => $timeboxings->lastPage(),
            'has_more_pages' => $timeboxings->hasMorePages()
        ]);

        return response()->json([
            'success' => true,
            'data' => $timeboxings->items(),
            'pagination' => [
                'current_page' => $timeboxings->currentPage(),
                'last_page' => $timeboxings->lastPage(),
                'per_page' => $timeboxings->perPage(),
                'total' => $timeboxings->total(),
                'from' => $timeboxings->firstItem(),
                'to' => $timeboxings->lastItem(),
                'has_more_pages' => $timeboxings->hasMorePages(),
                'next_page_url' => $timeboxings->nextPageUrl(),
                'prev_page_url' => $timeboxings->previousPageUrl(),
            ]
        ]);
    }

    // API endpoint to create new activity
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'project_id' => 'nullable|string|max:255',
            'no' => 'required|integer|unique:time_boxings,no',
            'information_date' => 'required|date',
            'user_position' => 'nullable|string|max:255',
            'department' => 'required|string',
            'application' => 'required|string',
            'type' => 'required|string',
            'description' => 'nullable|string',
            'action_solution' => 'nullable|string',
            'due_date' => 'nullable|date',
            'status' => 'required|string',
            'cnc_number' => 'nullable|string|max:255'
        ]);

        if ($validator->fails()) {
            \Log::error('TimeBoxing creation validation failed:', [
                'request_data' => $request->all(),
                'validation_errors' => $validator->errors()->toArray()
            ]);

            return response()->json([
                'success' => false,
                'message' => 'Validation failed',
                'errors' => $validator->errors(),
                'request_data' => $request->all() // For debugging
            ], 422);
        }

        try {
            $payload = $request->all();
            // Normalize empty strings to null for optional dates
            if (isset($payload['due_date']) && $payload['due_date'] === '') {
                $payload['due_date'] = null;
            }
            // Generate timeboxing_id if not provided
            if (empty($payload['timeboxing_id'])) {
                $nextNo = TimeBoxing::max('no') ? (TimeBoxing::max('no') + 1) : 1;
                $payload['timeboxing_id'] = 'TB' . str_pad($nextNo, 3, '0', STR_PAD_LEFT);
            }

            $timeBoxing = new TimeBoxing();
            $timeBoxing->fill($payload);
            $timeBoxing->save();

            return response()->json([
                'success' => true,
                'message' => 'TimeBoxing created successfully',
                'data' => $timeBoxing
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Failed to create time boxing',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    // API endpoint to update activity
    public function update(Request $request, $id)
    {
        $timeBoxing = TimeBoxing::findOrFail($id);

        // For partial updates (inline editing), only validate the fields that are being updated
        $requestData = $request->all();
        $isPartialUpdate = count($requestData) < 5; // If less than 5 fields, consider it a partial update

        if ($isPartialUpdate) {
            // For partial updates, only validate the specific field being updated
            $fieldToUpdate = array_key_first($requestData);
            $validationRules = [];

            switch ($fieldToUpdate) {
                case 'project_id':
                    $validationRules['project_id'] = 'nullable|string|max:255';
                    break;
                case 'no':
                    $validationRules['no'] = 'required|integer|unique:time_boxings,no,' . $id;
                    break;
                case 'information_date':
                    $validationRules['information_date'] = 'required|date';
                    break;
                case 'user_position':
                    $validationRules['user_position'] = 'nullable|string|max:255';
                    break;
                case 'department':
                    $validationRules['department'] = 'required|string';
                    break;
                case 'application':
                    $validationRules['application'] = 'required|string';
                    break;
                case 'type':
                    $validationRules['type'] = 'required|string';
                    break;
                case 'description':
                    $validationRules['description'] = 'nullable|string';
                    break;
                case 'action_solution':
                    $validationRules['action_solution'] = 'nullable|string';
                    break;
                case 'due_date':
                    $validationRules['due_date'] = 'nullable|date';
                    break;
                case 'status':
                    $validationRules['status'] = 'required|string';
                    break;
                case 'cnc_number':
                    $validationRules['cnc_number'] = 'nullable|string|max:255';
                    break;
            }
        } else {
            // Full update validation
            $validationRules = [
                'project_id' => 'nullable|string|max:255',
                'no' => 'required|integer|unique:time_boxings,no,' . $id,
                'information_date' => 'required|date',
                'user_position' => 'nullable|string|max:255',
                'department' => 'required|string',
                'application' => 'required|string',
                'type' => 'required|string',
                'description' => 'nullable|string',
                'action_solution' => 'nullable|string',
                'due_date' => 'nullable|date',
                'status' => 'required|string',
                'cnc_number' => 'nullable|string|max:255'
            ];
        }

        $validator = Validator::make($requestData, $validationRules);

        if ($validator->fails()) {
            \Log::error('TimeBoxing validation failed:', [
                'is_partial_update' => $isPartialUpdate,
                'field_updated' => $isPartialUpdate ? array_key_first($requestData) : 'full_update',
                'request_data' => $requestData,
                'validation_errors' => $validator->errors()->toArray()
            ]);

            return response()->json([
                'success' => false,
                'message' => 'Validation failed',
                'errors' => $validator->errors(),
                'request_data' => $requestData // For debugging
            ], 422);
        }

        try {
            $timeBoxing->fill($requestData);
            $timeBoxing->save();

            return response()->json([
                'success' => true,
                'message' => 'TimeBoxing updated successfully',
                'data' => $timeBoxing
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Failed to update activity',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    // API endpoint to delete activity
    public function destroy($id)
    {
        try {
            $timeBoxing = TimeBoxing::findOrFail($id);
            $timeBoxing->delete();

            return response()->json([
                'success' => true,
                'message' => 'TimeBoxing deleted successfully'
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Failed to delete activity',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    // API endpoint to get next available number
    public function getNextNumber()
    {
        $maxNo = TimeBoxing::max('no') ?? 0;

        return response()->json([
            'success' => true,
            'next_number' => $maxNo + 1
        ]);
    }
}




