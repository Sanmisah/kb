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
use App\Http\Controllers\InductionsController;
use App\Http\Controllers\QuizController;
use App\Http\Controllers\EmployeeDashboardController;
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

Route::get('/employee_dashboard', function () {
    return Inertia::render('Employee-Dashboard');
})->middleware(['auth', 'verified'])->name('employee_dashboard');
Route::resource('employee_dashboard', EmployeeDashboardController::class);
Route::get('employee_dashboard/{notice}/view',[EmployeeDashboardController::class, 'view'])->name('view');
Route::get('/induction', [EmployeeDashboardController::class, 'induction'])->name('induction');
Route::get('/induction/{induction}',[EmployeeDashboardController::class, 'quiz'])->name('quiz');
Route::post('/induction/{induction}', [EmployeeDashboardController::class, 'store'])->name('store');
Route::post('/components/dashboard_link1', [AuthenticatedSessionController::class, 'store'])->name('store');
// Route::get('/resources/js/Components/DashboardLink1.vue', function () {
//     return Inertia::render('Components/DashboardLink1');
// })->middleware(['auth', 'verified'])->name('Components/DashboardLink1');

Route::middleware(['auth', 'permission'])->group(function () {   
    Route::get('/article', [EmployeeDashboardController::class, 'show'])->name('article');
    Route::get('/notice', [EmployeeDashboardController::class, 'notices'])->name('notice');
    Route::get('/contacts', [EmployeeDashboardController::class, 'contacts'])->name('contacts');   
    Route::get('/article-detail/{article}', [EmployeeDashboardController::class, 'edit'])->name('article-detail');
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
    Route::get('/employees/{employee}/log', [EmployeesController::class, 'log'])->name('employees.log');

    Route::resource('articles', ArticlesController::class);
    Route::resource('inductions', InductionsController::class);
    Route::resource('quiz', QuizController::class);
});

require __DIR__.'/auth.php';
