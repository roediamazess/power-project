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

    // API endpoint to get all activities
    public function getActivities()
    {
        $activities = Activity::orderBy('no')->get();

        return response()->json([
            'success' => true,
            'data' => $activities
        ]);
    }

    // API endpoint to create new activity
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'project_id' => 'required|string|max:255',
            'no' => 'required|integer|unique:activities,no',
            'information_date' => 'required|date',
            'user_position' => 'required|string|max:255',
            'department' => 'required|string',
            'application' => 'required|string',
            'type' => 'required|string',
            'description' => 'required|string',
            'action_solution' => 'nullable|string',
            'due_date' => 'nullable|date',
            'status' => 'required|string',
            'cnc_number' => 'nullable|string|max:255'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => 'Validation failed',
                'errors' => $validator->errors()
            ], 422);
        }

        try {
            $activity = new Activity();
            $activity->activity_id = 'ACT-' . str_pad(Activity::max('id') + 1, 3, '0', STR_PAD_LEFT);
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

        $validator = Validator::make($request->all(), [
            'project_id' => 'required|string|max:255',
            'no' => 'required|integer|unique:activities,no,' . $id,
            'information_date' => 'required|date',
            'user_position' => 'required|string|max:255',
            'department' => 'required|string',
            'application' => 'required|string',
            'type' => 'required|string',
            'description' => 'required|string',
            'action_solution' => 'nullable|string',
            'due_date' => 'nullable|date',
            'status' => 'required|string',
            'cnc_number' => 'nullable|string|max:255'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => 'Validation failed',
                'errors' => $validator->errors()
            ], 422);
        }

        try {
            $activity->fill($request->all());
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

