<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Hash;
use App\Models\Pegawai;
use Illuminate\Http\Request;
use App\Models\User;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return view(
            'user',
            [
                'pegawais' => Pegawai::all(),
                'users' => User::all(),
            ],
        );
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view(
            'create.user',
            [
                'pegawais' => Pegawai::all(),
            ],
        );
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'pegawai_id' => 'required',
            'hak_akses' => 'required',
            'username' => 'required',
            'password' => 'required',
            'confirm_password' => 'required',
        ]);

        if ($validatedData['password'] == $validatedData['confirm_password']) {
            // User::create($validatedData);
            $user = new User();
            $user->pegawai_id = $validatedData['pegawai_id'];
            $user->hak_akses = $validatedData['hak_akses'];
            $user->username = $validatedData['username'];
            $user->password = hash('sha256', $validatedData['password']);
            $user->save();
        }

        return redirect('/users');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(User $user)
    {
        return view(
            'edit.user',
            [
                'user' => $user,
            ],
        );
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, User $user)
    {
        $validatedData = $request->validate([
            'username' => 'required',
            'hak_akses' => 'required',
            'password' => 'required',
            'confirm_password' => 'required',
        ]);

        if ($validatedData['password'] == $validatedData['confirm_password']) {
            $user = User::findOrFail($user->user_id);
            $user->hak_akses = $validatedData['hak_akses'];
            $user->username = $validatedData['username'];
            $user->password = hash('sha256', $validatedData['password']);
            $user->save();
        }

        return redirect('/users');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(User $user)
    {
        $user->delete();
        return redirect('/users');
    }
}
