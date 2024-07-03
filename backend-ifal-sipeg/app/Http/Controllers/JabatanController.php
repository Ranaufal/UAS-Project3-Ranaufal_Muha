<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreJabatanRequest;
use App\Http\Requests\UpdateJabatanRequest;
use App\Models\Jabatan;

class JabatanController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return view(
            'jabatan',
            [
                'jabatans' => Jabatan::all(),
            ],
        );
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view(
            'create.jabatans',
        );
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreJabatanRequest $request)
    {
        $validatedData = $request->validate([
            'nama_jabatan' => 'required',
            'deskripsi' => 'required',
            'gaji_pokok' => 'required',
            'created_at' => now(),
        ]);

        Jabatan::create($validatedData);

        return redirect('/jabatans');
    }

    /**
     * Display the specified resource.
     */
    public function show(Jabatan $jabatan)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Jabatan $jabatan)
    {
        return view('edit.jabatans', [
            'jabatan' => $jabatan,
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateJabatanRequest $request, Jabatan $jabatan)
    {
        $validatedData = $request->validate([
            'nama_jabatan' => 'required',
            'deskripsi' => 'required',
            'gaji_pokok' => 'required',
        ]);

        $jabatan->update($validatedData);

        return redirect('/jabatans');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Jabatan $jabatan)
    {
        $jabatan->delete();
        return redirect('/jabatans');
    }
}