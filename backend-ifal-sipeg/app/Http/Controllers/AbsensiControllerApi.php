<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Absensi;
use Illuminate\Support\Facades\DB;

class AbsensiControllerApi extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return Absensi::all();
    }

    public function store(Request $request)
    {
        return Absensi::create($request->all());
    }

    public function show($id)
    {
        return Absensi::findOrFail($id);
    }

    public function update(Request $request, $id)
    {
        $Absensi = Absensi::findOrFail($id);
        $Absensi->update($request->all());

        return $Absensi;
    }

    public function destroy($id)
    {
        $Absensi = Absensi::findOrFail($id);
        $Absensi->delete();

        return 204;
    }

    public function AbsenceEmployeesByManager($idmanager)
    {
        return DB::select("
        SELECT 
        a.absensi_id,
        p.pegawai_id,
        p.nama,
        u.url_profile,
        a.status_absensi,
        a.jam_masuk,
        a.jam_keluar,
        DATE(a.created_at) AS created_at

        FROM 
        users u join pegawais p USING(pegawai_id)
        join absensis a USING(pegawai_id)
         
        ORDER by created_at DESC

    ");
    }

    public function ListMyAbsence($id)
    {
        return DB::select("
        SELECT 
        a.absensi_id,
        p.pegawai_id,
        p.nama,
        u.url_profile,
        a.status_absensi,
        a.jam_masuk,
        a.jam_keluar,
        a.created_at 

        FROM 
        users u join pegawais p USING(pegawai_id)
        join absensis a USING(pegawai_id)
         
        WHERE pegawai_id = $id

        ORDER by created_at DESC

    ");
    }

    public function checkAbsenceThisDay($id)
    {
        return DB::select("
        SELECT 
        absensi_id,
        pegawai_id,
        created_at

        FROM absensis 
        WHERE pegawai_id = $id AND DATE(created_at) = DATE(now())
        ORDER by created_at DESC

    ");
    }
}
