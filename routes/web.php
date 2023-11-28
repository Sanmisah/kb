<?php

use App\Http\Controllers\ProfileController;
use App\Http\Controllers\RoleController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\PermissionsController;
use App\Http\Controllers\DesignationsController;
use App\Http\Controllers\DepartmentsController;
use App\Http\Controllers\NoticesController;
use App\Http\Controllers\SectionsController;
use App\Http\Controllers\EmployeesController;
use App\Http\Controllers\ArticlesController;
use Illuminate\Foundation\Application;
use App\Http\Controllers\Auth\AuthenticatedSessionController;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

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


Route::group(['middleware' => ['guest']], function() {
    Route::get('/', [AuthenticatedSessionController::class, 'create'])
            ->name('login');
});

Route::get('/dashboard', function () {
    return Inertia::render('Dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware(['auth', 'permission'])->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
    Route::get('/notices/export', [NoticesController::class, 'export'])->name('notices.export');
    Route::resource('roles', RoleController::class);
    Route::resource('users', UserController::class);
    Route::resource('permissions', PermissionsController::class);
    Route::resource('designations', DesignationsController::class);
    Route::resource('departments', DepartmentsController::class);
    Route::resource('notices', NoticesController::class);
    // Route::mediaLibrary();
    Route::resource('sections', SectionsController::class);
    Route::resource('employees',EmployeesController::class);
    Route::resource('articles', ArticlesController::class);
});

require __DIR__.'/auth.php';
