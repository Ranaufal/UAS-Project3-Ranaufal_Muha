<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\PegawaiControllerApi;
use App\Http\Controllers\UserControllerApi;
use App\Http\Controllers\JabatanControllerApi;
use App\Http\Controllers\GajiControllerApi;
use App\Http\Controllers\PenilaianKerjaControllerApi;
use App\Http\Controllers\CutiControllerApi;
use App\Http\Controllers\AbsensiControllerApi;
use App\Http\Controllers\CommentControllerApi;
use App\Http\Controllers\ConnectControllerApi;
use App\Http\Controllers\LikeControllerApi;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\PostControllerApi;
use App\Http\Controllers\UnlikeControllerApi;

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

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::resource('user', UserControllerApi::class);
Route::resource('pegawai', PegawaiControllerApi::class);
Route::resource('jabatan', JabatanControllerApi::class);
Route::resource('gaji', GajiControllerApi::class);
Route::resource('cuti', CutiControllerApi::class);
Route::resource('absensi', AbsensiControllerApi::class);
Route::resource('penilaiankerja', PenilaianKerjaControllerApi::class);

Route::resource('connect', ConnectControllerApi::class);
Route::resource('post', PostControllerApi::class);
Route::resource('comment', CommentControllerApi::class);
Route::resource('like', LikeControllerApi::class);
Route::resource('unlike', UnlikeControllerApi::class);

// get 
Route::get('showSearch', [UserControllerApi::class, "showSearch"]);
Route::get('readTotalLike/{id}', [LikeControllerApi::class, "readTotalLike"]);
Route::get('login/{username}/{password}', [LoginController::class, "LoginApi"]);


Route::get('absencemanager/{idmanager}', [AbsensiControllerApi::class, "AbsenceEmployeesByManager"]);
Route::get('cutimanager/{idmanager}', [CutiControllerApi::class, "CutiEmployeesByManager"]);
Route::get('manageremployees/{idmanager}', [PegawaiControllerApi::class, "ManagerEmployees"]);
Route::get('listpenilaiankerja/{idmanager}', [PenilaianKerjaControllerApi::class, "EmployeeQualityLists"]);
Route::get('listmyabsence/{id}', [AbsensiControllerApi::class, "ListMyAbsence"]);
Route::get('checkabsencethisday/{id}', [AbsensiControllerApi::class, "checkAbsenceThisDay"]);

Route::get('mycuti/{id}', [CutiControllerApi::class, "myCuti"]);

// Post 
Route::get('userPost', [PostControllerApi::class, "userPost"]);
Route::get('uniqueUserPost/{id}', [PostControllerApi::class, "uniqueUserPost"]);
