<?php

use App\Http\Controllers\AbsensiController;
use App\Http\Controllers\CutiController;
use App\Http\Controllers\GajiController;
use App\Http\Controllers\JabatanController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PegawaiController;
use App\Http\Controllers\PenilaianKerjaController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\PostController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/



Route::get('/login', [LoginController::class, 'login'])->middleware('guest');
Route::post('/login', [LoginController::class, 'authenticate']);
Route::post('/logout', [LoginController::class, 'logout']);


Route::middleware('isAdmin')->group(function () {

    Route::get('/', function () {
        return view('welcome');
    });

    Route::resource('users', UserController::class)->middleware('isManager');
    Route::resource('pegawais', PegawaiController::class);
    Route::resource('jabatans', JabatanController::class);
    Route::resource('gajis', GajiController::class);
    Route::resource('cutis', CutiController::class);
    Route::resource('absensis', AbsensiController::class);
    Route::resource('penilaian_kerjas', PenilaianKerjaController::class);
    Route::resource('postingans', PostController::class);
});
