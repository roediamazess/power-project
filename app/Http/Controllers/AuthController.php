<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

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

        // Login dengan data statis
        if ($request->email === 'pms@powerpro.id' && $request->password === 'Bismillah') {
            // Set session dengan data user
            $request->session()->put('user_id', 1);
            $request->session()->put('user_email', 'pms@powerpro.id');
            $request->session()->put('user_name', 'Komeng');
            $request->session()->put('user_role', 'Administrator');
            $request->session()->put('logged_in', true);
            
            // Regenerate session ID untuk keamanan
            $request->session()->regenerate();
            
            return redirect('/')->with('success', 'Login berhasil!');
        }

        return back()->withErrors(['email' => 'Email atau password salah.'])->withInput();
    }

    public function logout(Request $request)
    {
        $request->session()->forget(['user_id', 'user_email', 'user_name', 'user_role', 'logged_in']);
        $request->session()->invalidate();
        $request->session()->regenerateToken();
        return redirect()->route('login')->with('success', 'Logout berhasil!');
    }
}
