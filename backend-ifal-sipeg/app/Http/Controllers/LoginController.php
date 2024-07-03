<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class LoginController extends Controller
{
    public function login()
    {
        return view('login');
    }

    public function authenticate(Request $request): RedirectResponse
    {


        $credentials = $request->validate([
            'username' => ['required'],
            'password' => ['required'],
        ]);

        try {
            $pegawai = DB::select(
                'SELECT pegawai_id, hak_akses FROM users WHERE username = ? AND password = ?',
                [
                    $credentials['username'],
                    hash('sha256', $credentials['password']),
                ],
            );
            if ($pegawai && $pegawai[0]->hak_akses != 3) {
                $request->session()->put('pegawai_id', $pegawai[0]->pegawai_id);
                $request->session()->put('hak_akses', $pegawai[0]->hak_akses);

                return redirect()->intended("/");
            }

            return back()->withErrors([
                'username' => 'The provided credentials do not match our records.',
            ])->onlyInput('username');
        } catch (\Throwable $th) {
            return back()->withErrors([
                'username' => 'The provided credentials do not match our records.',
            ])->onlyInput('username');
        }
    }

    public function logout(Request $request): RedirectResponse
    {
        // Auth::logout();

        // $request->session()->invalidate();

        // $request->session()->regenerateToken();
        $request->session()->put('pegawai_id', null);
        $request->session()->put('hak_akses', null);

        return redirect('/login');
    }

    public function LoginApi($username, $password)
    {
        $mypassword = hash('sha256', $password);
        return DB::select("
        SELECT pegawai_id,user_id,hak_akses,username
        FROM users
        WHERE username = '$username' AND password = '$mypassword'
    ");
    }
}
