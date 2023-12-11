<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Http\Requests\Auth\LoginRequest;
use App\Providers\RouteServiceProvider;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;
use Inertia\Response;
use App\Models\UserLogin;
use Carbon\Carbon;
use Jenssegers\Agent\Facades\Agent;

class AuthenticatedSessionController extends Controller
{
    /**
     * Display the login view.
     */
    public function create(): Response
    {
        return Inertia::render('Auth/Login', [
            'canResetPassword' => Route::has('password.request'),
            'status' => session('status'),
        ]);
    }

    /**
     * Handle an incoming authentication request.
     */
    public function store(LoginRequest $request): RedirectResponse
    {
        $request->authenticate();

        $request->session()->regenerate();
        $user_agent = isset($_SERVER['HTTP_USER_AGENT']) ? $_SERVER['HTTP_USER_AGENT'] : 'none';
        $browser = Agent::browser();
        $version = Agent::version($browser);

        $platform = Agent::platform();
        $versions = Agent::version($platform);
  
        $role =  auth()->user()->roles()->pluck('name')->first();
        UserLogin::create([
            'user_id' => auth()->user()->id,
            'ip_address' => $request->getClientIp(),
            'user_agent' => $user_agent,
            'browser' => $browser. ' '.$version,
            'platform' => $platform. ' '.$versions,
            'session_id' => $request->session()->getId(),
            'logged_in' => Carbon::now(),
        ]);

        if($role == 'Employee'){
            return redirect()->intended(RouteServiceProvider::EMPLOYEE);
        }    

        return redirect()->intended(RouteServiceProvider::HOME);
    }

    /**
     * Destroy an authenticated session.
     */
    public function destroy(Request $request): RedirectResponse
    {
        $userLogin = auth()->user()->UserLogins()->where('session_id', $request->session()->getId())->first();
        if($userLogin){
            $userLogin->logged_out = $userLogin->freshTimestamp();
            $userLogin->save();
        }
        Auth::guard('web')->logout();

        $request->session()->invalidate();

        $request->session()->regenerateToken();

        return redirect('/');
    }
}
