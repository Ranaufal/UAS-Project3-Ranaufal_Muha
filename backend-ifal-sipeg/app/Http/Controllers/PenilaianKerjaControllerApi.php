<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\PenilaianKerja;
use Illuminate\Support\Facades\DB;

class PenilaianKerjaControllerApi extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return PenilaianKerja::all();
    }

    public function store(Request $request)
    {
        return PenilaianKerja::create($request->all());
    }

    public function show($id)
    {
        return PenilaianKerja::findOrFail($id);
    }

    public function update(Request $request, $id)
    {
        $PenilaianKerja = PenilaianKerja::findOrFail($id);
        $PenilaianKerja->update($request->all());

        return $PenilaianKerja;
    }

    public function destroy($id)
    {
        $PenilaianKerja = PenilaianKerja::findOrFail($id);
        $PenilaianKerja->delete();

        return 204;
    }

    public function EmployeeQualityLists($idmanager)
    {
        return DB::select("
        SELECT 
        u.user_id,
        p.pegawai_id,
        p.nama,
        u.username,
        u.url_profile,
        pk.total,
        pk.created_at

        FROM 
        users u join pegawais p USING(pegawai_id)
        join penilaian_kerjas pk USING(pegawai_id)

        WHERE manager_id = $idmanager

        ORDER BY created_at DESC
    ");
    }
}
