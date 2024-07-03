<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use App\Http\Requests\StorePegawaiRequest;
use App\Http\Requests\UpdatePegawaiRequest;
use App\Models\Jabatan;
use App\Models\Pegawai;

class PegawaiController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return view(
            'pegawais',
            [
                'pegawais' => Pegawai::all(),
            ],
        );
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('create.pegawais', [
            'jabatans' => Jabatan::all(),
        ]);
    }

    public function store(StorePegawaiRequest $request)
    {
        $validatedData = $request->validate([
            'nama' => 'required',
            'nohp' => 'required',
            'alamat' => 'required',
            'email' => 'required',
            'jabatan_id' => 'required',
            'tgl_masuk_day' => 'required',
            'tgl_masuk_month' => 'required',
            'tgl_masuk_year' => 'required',
        ]);

        DB::insert(
            'INSERT INTO pegawais (manager_id,nama, nohp, alamat, email, jabatan_id, tgl_masuk) VALUES (?,?, ?, ?, ?, ?, ?)',
            [
                session('pegawai_id'),
                $validatedData['nama'],
                $validatedData['nohp'],
                $validatedData['alamat'],
                $validatedData['email'],
                $validatedData['jabatan_id'],
                $validatedData['tgl_masuk_year'] . '-' . $validatedData['tgl_masuk_month'] . '-' . $validatedData['tgl_masuk_day'],
            ],
        );

        return redirect('/pegawais');
    }

    /**
     * Display the specified resource.
     */
    public function show(Pegawai $pegawai)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Pegawai $pegawai)
    {
        return view('edit.pegawais', [
            'pegawai' => $pegawai,
            'jabatans' => Jabatan::all(),
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdatePegawaiRequest $request, Pegawai $pegawai)
    {
        $validatedData = $request->validate([
            'nama' => 'required',
            'nohp' => 'required',
            'alamat' => 'required',
            'email' => 'required',
            'jabatan_id' => 'required',
        ]);

        DB::table('pegawais')
            ->where('pegawai_id', $pegawai->pegawai_id)
            ->update([
                'nama' => $validatedData['nama'],
                'nohp' => $validatedData['nohp'],
                'alamat' => $validatedData['alamat'],
                'email' => $validatedData['email'],
                'jabatan_id' => $validatedData['jabatan_id'],
            ]);

        return redirect('/pegawais');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Pegawai $pegawai)
    {
        $pegawai->delete();
        return redirect('/pegawais');
    }
}
