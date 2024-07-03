<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use App\Http\Requests\StoreAbsensiRequest;
use App\Http\Requests\UpdateAbsensiRequest;
use App\Models\Absensi;
use App\Models\Pegawai;

class AbsensiController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return view(
            'absensi',
            [
                'absensis' => Absensi::all(),
            ],
        );
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view(
            'create.absensi',
            [
                'pegawais' => Pegawai::all(),
            ],
        );
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreAbsensiRequest $request)
    {
        $validatedData = $request->validate([
            'pegawai_id' => 'required',
            'status_absensi' => 'required',
            'jam_masuk_hr' => 'required',
            'jam_masuk_mnt' => 'required',
            'jam_masuk_seccond' => 'required',
            'jam_keluar_hr' => 'required',
            'jam_keluar_mnt' => 'required',
            'jam_keluar_seccond' => 'required',
        ]);

        // DB::insert(
        //     'INSERT INTO absensis (pegawai_id, tgl_absensi, status_absensi, jam_masuk, jam_keluar) VALUES (?, ?, ?, ?, ?)',
        //     [
        //         $validatedData['pegawai_id'],
        //         $validatedData['year'] . '-' . $validatedData['month'] . '-' . $validatedData['day'],
        //         $validatedData['status_absensi'],
        // $validatedData['jam_masuk_hr'] . ':' . $validatedData['jam_masuk_mnt'] . ':' . $validatedData['jam_masuk_seccond'],
        // $validatedData['jam_keluar_hr'] . ':' . $validatedData['jam_keluar_mnt'] . ':' . $validatedData['jam_keluar_seccond'],
        //     ],
        // );

        $absen = new Absensi();
        $absen->pegawai_id = $validatedData['pegawai_id'];
        $absen->status_absensi = $validatedData['status_absensi'];
        $absen->jam_masuk = $validatedData['jam_masuk_hr'] . ':' . $validatedData['jam_masuk_mnt'] . ':' . $validatedData['jam_masuk_seccond'];
        $absen->jam_keluar = $validatedData['jam_keluar_hr'] . ':' . $validatedData['jam_keluar_mnt'] . ':' . $validatedData['jam_keluar_seccond'];
        $absen->save();

        return redirect('/absensis');
    }

    /**
     * Display the specified resource.
     */
    public function show(Absensi $absensi)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Absensi $absensi)
    {
        return view(
            'edit.absensi',
            [
                'absensi' => $absensi,
            ],
        );
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateAbsensiRequest $request, Absensi $absensi)
    {
        $validatedData = $request->validate([
            'status_absensi' => 'required',
            'jam_masuk' => 'required',
            'jam_keluar' => 'required',
        ]);

        $absen = Absensi::findOrFail($absensi->absensi_id);
        $absen->status_absensi = $validatedData['status_absensi'];
        $absen->jam_masuk = $validatedData['jam_masuk'];
        $absen->jam_keluar = $validatedData['jam_keluar'];
        $absen->save();

        return redirect('/absensis');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Absensi $absensi)
    {
        $absensi->delete();
        return redirect('/absensis');
    }
}
