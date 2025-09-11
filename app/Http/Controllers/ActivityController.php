<?php

namespace App\Http\Controllers;

use App\Models\Activity;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class ActivityController extends Controller
{
    public function index()
    {
        return view('activity.index');
    }

    // API endpoint to get all activities with pagination
    public function getActivities(Request $request)
    {
        $perPage = $request->get('per_page', 10); // Default 10 items per page
        $page = $request->get('page', 1);
        $showAll = $request->get('show_all', false); // New parameter to show all activities

        // Add logging to diagnose pagination issue
        $totalActivities = Activity::count();
        \Log::info('Activity API Request', [
            'requested_per_page' => $perPage,
            'requested_page' => $page,
            'show_all' => $showAll,
            'total_activities_in_db' => $totalActivities,
            'timestamp' => now()
        ]);

        if ($showAll) {
            // Return all activities without pagination
            $activities = Activity::orderBy('no')->get();

            \Log::info('Activity API Response (All)', [
                'returned_count' => $activities->count(),
                'total_available' => $totalActivities
            ]);

            return response()->json([
                'success' => true,
                'data' => $activities,
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

        $activities = Activity::orderBy('no')->paginate($perPage);

        \Log::info('Activity API Response (Paginated)', [
            'returned_count' => count($activities->items()),
            'total_available' => $activities->total(),
            'current_page' => $activities->currentPage(),
            'last_page' => $activities->lastPage(),
            'has_more_pages' => $activities->hasMorePages()
        ]);

        return response()->json([
            'success' => true,
            'data' => $activities->items(),
            'pagination' => [
                'current_page' => $activities->currentPage(),
                'last_page' => $activities->lastPage(),
                'per_page' => $activities->perPage(),
                'total' => $activities->total(),
                'from' => $activities->firstItem(),
                'to' => $activities->lastItem(),
                'has_more_pages' => $activities->hasMorePages(),
                'next_page_url' => $activities->nextPageUrl(),
                'prev_page_url' => $activities->previousPageUrl(),
            ]
        ]);
    }

    // API endpoint to create new activity
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'project_id' => 'nullable|string|max:255',
            'no' => 'required|integer|unique:activities,no',
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
            \Log::error('Activity creation validation failed:', [
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
            $activity = new Activity();
            $activity->fill($request->all());
            $activity->save();

            return response()->json([
                'success' => true,
                'message' => 'Activity created successfully',
                'data' => $activity
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Failed to create activity',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    // API endpoint to update activity
    public function update(Request $request, $id)
    {
        $activity = Activity::findOrFail($id);

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
                    $validationRules['no'] = 'required|integer|unique:activities,no,' . $id;
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
                'no' => 'required|integer|unique:activities,no,' . $id,
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
            \Log::error('Activity validation failed:', [
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
            $activity->fill($requestData);
            $activity->save();

            return response()->json([
                'success' => true,
                'message' => 'Activity updated successfully',
                'data' => $activity
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
            $activity = Activity::findOrFail($id);
            $activity->delete();

            return response()->json([
                'success' => true,
                'message' => 'Activity deleted successfully'
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
        $maxNo = Activity::max('no') ?? 0;

        return response()->json([
            'success' => true,
            'next_number' => $maxNo + 1
        ]);
    }
}




