<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use App\Models\User;

class AuthController extends Controller
{
    public function showLogin()
    {
        return view('auth.login');
    }

    public function login(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required'
        ]);

        // Cari user di database
        $user = User::where('email', $request->email)->first();

        // Verifikasi password
        if ($user && Hash::check($request->password, $user->password)) {
            // Set session dengan data user dari database
            $request->session()->put('user_id', $user->id);
            $request->session()->put('user_email', $user->email);
            $request->session()->put('user_name', $user->display_name);
            $request->session()->put('user_full_name', $user->full_name);
            $request->session()->put('user_role', $user->user_role);
            $request->session()->put('user_tier', $user->tier);
            $request->session()->put('logged_in', true);

            // Regenerate session ID untuk keamanan
            $request->session()->regenerate();

            // Log successful login
            \Log::info('User logged in successfully', [
                'user_id' => $user->id,
                'email' => $user->email,
                'role' => $user->user_role
            ]);

            return redirect('/')->with('success', 'Login berhasil! Selamat datang ' . $user->display_name);
        }

        // Log failed login attempt
        \Log::warning('Failed login attempt', [
            'email' => $request->email,
            'ip' => $request->ip()
        ]);

        return back()->withErrors(['email' => 'Email atau password salah.'])->withInput();
    }

    public function logout(Request $request)
    {
        // Log logout
        if ($request->session()->has('user_email')) {
            \Log::info('User logged out', [
                'email' => $request->session()->get('user_email')
            ]);
        }

        $request->session()->forget([
            'user_id',
            'user_email',
            'user_name',
            'user_full_name',
            'user_role',
            'user_tier',
            'logged_in'
        ]);
        $request->session()->invalidate();
        $request->session()->regenerateToken();
        return redirect()->route('login')->with('success', 'Logout berhasil!');
    }

    public function checkSession(Request $request)
    {
        if ($request->session()->has('logged_in') && $request->session()->get('logged_in')) {
            return response()->json([
                'authenticated' => true,
                'user' => [
                    'id' => $request->session()->get('user_id'),
                    'email' => $request->session()->get('user_email'),
                    'name' => $request->session()->get('user_name'),
                    'full_name' => $request->session()->get('user_full_name'),
                    'role' => $request->session()->get('user_role'),
                    'tier' => $request->session()->get('user_tier')
                ]
            ]);
        }

        return response()->json([
            'authenticated' => false,
            'message' => 'Not authenticated'
        ], 401);
    }
}
