<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Pegawai;
use Illuminate\Support\Facades\DB;

class PegawaiControllerApi extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return Pegawai::all();
    }

    public function store(Request $request)
    {
        return Pegawai::create($request->all());
    }

    public function show($id)
    {
        return Pegawai::findOrFail($id);
    }

    public function update(Request $request, $id)
    {
        $Pegawai = Pegawai::findOrFail($id);
        $Pegawai->update($request->all());

        return $Pegawai;
    }

    public function destroy($id)
    {
        $Pegawai = Pegawai::findOrFail($id);
        $Pegawai->delete();

        return 204;
    }

    public function ManagerEmployees($idmanager)
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

        WHERE p.manager_id = $idmanager
    ");
    }
}
