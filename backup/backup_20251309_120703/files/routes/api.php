<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ActivityController;
use App\Http\Controllers\TimeBoxingController;
use App\Http\Controllers\UsersController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

// Activity API routes (no CSRF required)
Route::controller(ActivityController::class)->group(function () {
    Route::get('/activities', 'getActivities')->name('activities.get');
    Route::post('/activities', 'store')->name('activities.store');
    Route::put('/activities/{id}', 'update')->name('activities.update');
    Route::delete('/activities/{id}', 'destroy')->name('activities.destroy');
    Route::get('/activities/next-number', 'getNextNumber')->name('activities.next-number');
});

// Time Boxing API routes (no CSRF required)
Route::controller(TimeBoxingController::class)->group(function () {
    Route::get('/timeboxing', 'getTimeBoxings')->name('timeboxing.get');
    Route::post('/timeboxing', 'store')->name('timeboxing.store');
    Route::put('/timeboxing/{id}', 'update')->name('timeboxing.update');
    Route::delete('/timeboxing/{id}', 'destroy')->name('timeboxing.destroy');
    Route::get('/timeboxing/next-number', 'getNextNumber')->name('timeboxing.next-number');
});

// Users Management API routes (no CSRF required)
Route::controller(UsersController::class)->group(function () {
    Route::get('/users', 'getUsers')->name('users.get');
    Route::post('/users', 'store')->name('users.store');
    Route::put('/users/{id}', 'update')->name('users.update');
    Route::delete('/users/{id}', 'destroy')->name('users.destroy');
    Route::post('/users/{id}/update-role', 'updateRole')->name('users.update-role');
});