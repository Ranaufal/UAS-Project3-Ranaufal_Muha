<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use App\Http\Requests\StorePenilaianKerjaRequest;
use App\Http\Requests\UpdatePenilaianKerjaRequest;
use App\Models\Pegawai;
use App\Models\PenilaianKerja;

class PenilaianKerjaController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return view(
            'penilaian',
            [
                'penilaians' => PenilaianKerja::all(),
            ],
        );
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view(
            'create.penilaian',
            [
                'pegawais' => Pegawai::all(),
            ],
        );
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StorePenilaianKerjaRequest $request)
    {
        $validatedData = $request->validate([
            'pegawai_id' => 'required',
            'kehadiran' => 'required',
            'kinerja' => 'required',
            'kerjasama' => 'required',
            'kreatifitas' => 'required',
            'kepemimpinan' => 'required',
            'pemecahan_masalah' => 'required',
        ]);


        $total = ($validatedData['kehadiran'] + $validatedData['kinerja'] + $validatedData['kerjasama'] + $validatedData['kreatifitas'] + $validatedData['kepemimpinan'] + $validatedData['pemecahan_masalah']) / 6 * 10;



        $penilaian = new PenilaianKerja();
        $penilaian->pegawai_id = $validatedData['pegawai_id'];
        $penilaian->penilai_id = session()->get('pegawai_id');
        $penilaian->kehadiran = $validatedData['kehadiran'];
        $penilaian->kinerja = $validatedData['kinerja'];
        $penilaian->kerjasama = $validatedData['kerjasama'];
        $penilaian->kreatifitas = $validatedData['kreatifitas'];
        $penilaian->kepemimpinan = $validatedData['kepemimpinan'];
        $penilaian->pemecahan_masalah = $validatedData['pemecahan_masalah'];
        $penilaian->total = $total;
        $penilaian->save();

        return redirect('/penilaian_kerjas');
    }

    /**
     * Display the specified resource.
     */
    public function show(PenilaianKerja $penilaianKerja)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(PenilaianKerja $penilaianKerja)
    {
        return view(
            'edit.penilaian',
            [
                'penilaian' => $penilaianKerja,
            ],
        );
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdatePenilaianKerjaRequest $request, PenilaianKerja $penilaianKerja)
    {
        $validatedData = $request->validate([
            'kehadiran' => 'required',
            'kinerja' => 'required',
            'kerjasama' => 'required',
            'kreatifitas' => 'required',
            'kepemimpinan' => 'required',
            'pemecahan_masalah' => 'required',
        ]);


        $total = (($validatedData['kehadiran'] + $validatedData['kinerja'] + $validatedData['kerjasama'] + $validatedData['kreatifitas'] + $validatedData['kepemimpinan'] + $validatedData['pemecahan_masalah']) / 6) * 10;

        $penilaian = PenilaianKerja::findOrFail($penilaianKerja->penilaiankerja_id);
        $penilaian->kehadiran = $validatedData['kehadiran'];
        $penilaian->kinerja = $validatedData['kinerja'];
        $penilaian->kerjasama = $validatedData['kerjasama'];
        $penilaian->kreatifitas = $validatedData['kreatifitas'];
        $penilaian->kepemimpinan = $validatedData['kepemimpinan'];
        $penilaian->pemecahan_masalah = $validatedData['pemecahan_masalah'];
        $penilaian->total = $total;
        $penilaian->save();

        return redirect('/penilaian_kerjas');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(PenilaianKerja $penilaianKerja)
    {
        $penilaianKerja->delete();
        return redirect('/penilaian_kerjas');
    }
}
