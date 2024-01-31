<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\leaveController;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('index');
});
Route::get('/nameurl', [leaveController::class, 'namefun']);
Route::get('/leaveurl', [leaveController::class, 'leavefun']);
Route::get('/totalurl', [leaveController::class, 'totalfun']);
Route::post('/leaveform', [leaveController::class, 'leaveform']);

