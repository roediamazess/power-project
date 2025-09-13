<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    public function updateUser(Request $request)
    {
        try {
            // Debug: Log all incoming data
            \Log::info('UpdateUser Request Data:', $request->all());

            $userId = $request->input('id'); // Changed from 'user_id' to 'id'
            $fullName = $request->input('full_name');
            $password = $request->input('password');
            $tier = $request->input('tier');
            $userRole = $request->input('user_role');
            $startWork = $request->input('start_work');
            $birthday = $request->input('birthday');

            \Log::info('Parsed data:', [
                'userId' => $userId,
                'fullName' => $fullName,
                'tier' => $tier,
                'userRole' => $userRole,
                'startWork' => $startWork,
                'birthday' => $birthday
            ]);

            // Validate required fields
            if (empty($fullName) || empty($tier) || empty($userRole)) {
                return response()->json([
                    'success' => false,
                    'message' => 'Full Name, Tier, and User Role are required fields!'
                ], 400);
            }

            // Prepare update data
            $updateData = [
                'full_name' => $fullName,
                'tier' => $tier,
                'user_role' => $userRole,
                'start_work' => $startWork ?: null,
                'birthday' => $birthday ?: null,
                'updated_at' => now()
            ];

            // Only update password if provided
            if (!empty($password)) {
                $updateData['password'] = Hash::make($password);
            }

            \Log::info('Update data prepared:', $updateData);

            // Update user in database using ID instead of email
            $result = DB::table('users')
                ->where('id', $userId)
                ->update($updateData);

            \Log::info('Database update result:', ['result' => $result]);

            if ($result > 0) {
                return response()->json([
                    'success' => true,
                    'message' => 'User updated successfully!'
                ]);
            } else {
                return response()->json([
                    'success' => false,
                    'message' => 'No changes made or user not found!'
                ]);
            }

        } catch (\Exception $e) {
            \Log::error('UpdateUser Error:', ['error' => $e->getMessage()]);
            return response()->json([
                'success' => false,
                'message' => 'Error updating user: ' . $e->getMessage()
            ], 500);
        }
    }

    public function updateAllUsers(Request $request)
    {
        try {
            $users = $request->input('users', []);
            $updatedCount = 0;

            foreach ($users as $userData) {
                $updateData = [
                    'full_name' => $userData['full_name'],
                    'tier' => $userData['tier'],
                    'user_role' => $userData['user_role'],
                    'start_work' => $userData['start_work'] ?: null,
                    'birthday' => $userData['birthday'] ?: null,
                    'updated_at' => now()
                ];

                // Only update password if provided
                if (!empty($userData['password'])) {
                    $updateData['password'] = Hash::make($userData['password']);
                }

                $result = DB::table('users')
                    ->where('email', $userData['email'])
                    ->update($updateData);

                if ($result) {
                    $updatedCount++;
                }
            }

            return response()->json([
                'success' => true,
                'message' => "Successfully updated {$updatedCount} users!",
                'updated_count' => $updatedCount
            ]);

        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Error updating users: ' . $e->getMessage()
            ], 500);
        }
    }
}
