<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ActivityController;

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