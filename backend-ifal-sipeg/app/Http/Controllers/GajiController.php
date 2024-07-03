<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use App\Http\Requests\StoreGajiRequest;
use App\Http\Requests\UpdateGajiRequest;
use App\Models\Gaji;
use App\Models\Jabatan;
use App\Models\Pegawai;

class GajiController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return view(
            'gaji',
            [
                'gajis' => Gaji::all(),
            ],
        );
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view(
            'create.gajis',
            [
                'pegawais' => Pegawai::all(),
                'jabatans' => Jabatan::all(),
            ],
        );
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreGajiRequest $request)
    {
        $validatedData = $request->validate([
            'pegawai_id' => 'required',
            'tunjangan' => '',
            'potongan_gaji0' => '',
            'potongan_gaji1' => '',
            'potongan_gaji2' => '',
        ]);
        $list = ['Pinjaman Koperasi', 'Asuransi', 'Potongan Kehadiran'];
        $potongan_gaji = 0;
        $ket_potongan_gaji = "";


        $pegawai = DB::select(
            'SELECT gaji_pokok FROM pegawais join jabatans USING(jabatan_id) WHERE pegawai_id = ?',
            [
                $validatedData['pegawai_id'],
            ],
        );
        if ($pegawai) {
            $gajiPokok = $pegawai[0]->gaji_pokok;
            for ($i = 0; $i < 3; $i++) {
                if ($validatedData['potongan_gaji' . $i]) {
                    $ket_potongan_gaji = $list[$i] . "," . $ket_potongan_gaji;
                    $potongan_gaji = $validatedData['potongan_gaji' . $i] + $potongan_gaji;
                }
            }
            $total_gaji = $gajiPokok + $validatedData['tunjangan'] - $potongan_gaji;
        }

        $gaji = new Gaji();
        $gaji->pegawai_id = $validatedData['pegawai_id'];
        $gaji->tunjangan = $validatedData['tunjangan'];
        $gaji->potongan_gaji = $potongan_gaji;
        $gaji->ket_potongan_gaji = $ket_potongan_gaji == '' ? "-" : $ket_potongan_gaji;
        $gaji->total_gaji = $total_gaji;
        $gaji->save();

        return redirect('/gajis');
    }

    /**
     * Display the specified resource.
     */
    public function show(Gaji $gaji)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Gaji $gaji)
    {
        return view(
            'edit.gajis',
            [
                'gajis' => $gaji,
            ],
        );
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateGajiRequest $request, Gaji $gaji)
    {
        $validatedData = $request->validate([
            'pegawai_id' => 'required',
            'tunjangan' => '',
            'potongan_gaji0' => '',
            'potongan_gaji1' => '',
            'potongan_gaji2' => '',
        ]);


        $list = ['Pinjaman Koperasi', 'Asuransi', 'Potongan Kehadiran'];
        $potongan_gaji = 0;
        $ket_potongan_gaji = "";
        for ($i = 0; $i < 3; $i++) {
            if ($validatedData['potongan_gaji' . $i]) {
                $ket_potongan_gaji = $list[$i] . "," . $ket_potongan_gaji;
                $potongan_gaji = $validatedData['potongan_gaji' . $i] + $potongan_gaji;
            }
        }

        $gajiPokok = $gaji->pegawai->jabatan->gaji_pokok;
        $total_gaji = $gajiPokok + $validatedData['tunjangan'] - $potongan_gaji;

        $gajis = Gaji::findOrFail($gaji->gaji_id);
        $gajis->pegawai_id = $validatedData['pegawai_id'];
        $gajis->tunjangan = $validatedData['tunjangan'];
        $gajis->potongan_gaji = $potongan_gaji;
        $gajis->ket_potongan_gaji = $ket_potongan_gaji == '' ? "-" : $ket_potongan_gaji;
        $gajis->total_gaji = $total_gaji;
        $gajis->save();

        // DB::table('gajis')
        //     ->where('pegawai_id', $gaji->pegawai_id)
        //     ->update([
        //         'tunjangan' => $validatedData['tunjangan'],
        //         'potongan_gaji' => $validatedData['potongan_gaji'],
        //         'total_gaji' => $total_gaji,
        //     ]);
        return redirect('/gajis');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Gaji $gaji)
    {
        $gaji->delete();
        return redirect('/gajis');
    }
}
