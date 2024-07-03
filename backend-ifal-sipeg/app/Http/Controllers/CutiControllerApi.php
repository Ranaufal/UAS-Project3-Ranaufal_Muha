<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Cuti;
use Illuminate\Support\Facades\DB;

class CutiControllerApi extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return Cuti::all();
    }

    public function store(Request $request)
    {
        return Cuti::create($request->all());
    }

    public function show($id)
    {
        return Cuti::findOrFail($id);
    }

    public function update(Request $request, $id)
    {
        $Cuti = Cuti::findOrFail($id);
        $Cuti->update($request->all());

        return $Cuti;
    }

    public function destroy($id)
    {
        $Cuti = Cuti::findOrFail($id);
        $Cuti->delete();

        return 204;
    }

    public function CutiEmployeesByManager($idmanager)
    {
        return DB::select("
        SELECT 
        c.cuti_id,
        p.pegawai_id,
        p.nama,
        u.url_profile,
        c.detail_cuti,
        c.status_cuti,
        DATEDIFF(c.tgl_selesai, c.tgl_mulai) AS days,
        c.tgl_mulai,
        c.tgl_selesai,
        DATE(c.created_at) AS created_at

        FROM 
        users u join pegawais p USING(pegawai_id)
        join cutis c USING(pegawai_id)
        ORDER BY cuti_id DESC
    ");
    }

    public function myCuti($id)
    {
        return DB::select("
        SELECT 
        c.cuti_id,
        p.pegawai_id,
        p.nama,
        u.url_profile,
        c.detail_cuti,
        c.status_cuti,
        DATEDIFF(c.tgl_selesai, c.tgl_mulai) AS days,
        c.tgl_mulai,
        c.tgl_selesai,
        DATE(c.created_at) AS created_at

        FROM 
        users u join pegawais p USING(pegawai_id)
        join cutis c USING(pegawai_id)

        WHERE pegawai_id = $id

        ORDER BY cuti_id DESC
    ");
    }
}
