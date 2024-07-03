<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class UserControllerApi extends Controller
{
    public function index()
    {
        return User::all();
    }

    public function store(Request $request)
    {
        $user = new User();
        $user->pegawai_id = $request['pegawai_id'];
        $user->hak_akses = $request['hak_akses'];
        $user->username = $request['username'];
        $user->password = hash('sha256', $request['password']);
        $user->save();
        return $user;
        // return User::create($request->all());
    }

    public function show($id)
    {
        return User::findOrFail($id);
    }

    public function update(Request $request, $id)
    {
        $user = User::findOrFail($id);
        // $user->update($request->all());
        $user->hak_akses = $request['hak_akses'];
        $user->username = $request['username'];
        $user->password = hash('sha256', $request['password']);
        $user->save();

        return $user;
    }

    public function destroy($id)
    {
        $user = User::findOrFail($id);
        $user->delete();

        return 204;
    }

    // ================================================
    public function showSearch()
    {
        return DB::select("
        SELECT 
        u.user_id,
        p.pegawai_id,
        p.nama,
        u.username,
        u.url_profile,
        j.nama_jabatan

        FROM 
        users u join pegawais p USING(pegawai_id)
        join jabatans j USING(jabatan_id)
    ");
    }
}
