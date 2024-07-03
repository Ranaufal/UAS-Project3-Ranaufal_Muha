<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use App\Http\Requests\StoreCutiRequest;
use App\Http\Requests\UpdateCutiRequest;
use App\Models\Cuti;
use App\Models\Pegawai;

class CutiController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return view(
            'cuti',
            [
                'cutis' => Cuti::select('*', DB::raw('DATEDIFF(tgl_selesai, tgl_mulai) AS lama_cuti'))->get(),
            ],
        );
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view(
            'create.cutis',
            [
                'pegawais' => Pegawai::all(),
            ],
        );
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreCutiRequest $request)
    {
        $validatedData = $request->validate([
            'pegawai_id' => 'required',
            'detail_cuti' => 'required',
            'day-mulai' => 'required',
            'month-mulai' => 'required',
            'year-mulai' => 'required',
            'day-selesai' => 'required',
            'month-selesai' => 'required',
            'year-selesai' => 'required',
        ]);

        $cutis = new Cuti();
        $cutis->pegawai_id = $validatedData['pegawai_id'];
        $cutis->detail_cuti = $validatedData['detail_cuti'];
        $cutis->tgl_mulai = $validatedData['year-mulai'] . '-' . $validatedData['month-mulai'] . '-' . $validatedData['day-mulai'];
        $cutis->tgl_selesai = $validatedData['year-selesai'] . '-' . $validatedData['month-selesai'] . '-' . $validatedData['day-selesai'];
        $cutis->save();



        return redirect('/cutis');
    }

    /**
     * Display the specified resource.
     */
    public function show(Cuti $cuti)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Cuti $cuti)
    {
        return view(
            'edit.cutis',
            [
                'cutis' => $cuti,
            ],
        );
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateCutiRequest $request, Cuti $cuti)
    {
        $validatedData = $request->validate([
            // 'pegawai_id' => '',
            'detail_cuti' => '',
            'day-mulai' => 'required',
            'month-mulai' => 'required',
            'year-mulai' => 'required',
            'day-selesai' => 'required',
            'month-selesai' => 'required',
            'year-selesai' => 'required',
            'status_cuti' => 'required',
        ]);

        $cutis = Cuti::findOrFail($cuti->cuti_id);
        // $cutis->pegawai_id = $validatedData['pegawai_id'];
        $cutis->detail_cuti = $validatedData['detail_cuti'];
        $cutis->tgl_mulai = $validatedData['year-mulai'] . '-' . $validatedData['month-mulai'] . '-' . $validatedData['day-mulai'];
        $cutis->tgl_selesai = $validatedData['year-selesai'] . '-' . $validatedData['month-selesai'] . '-' . $validatedData['day-selesai'];
        $cutis->status_cuti = $validatedData['status_cuti'];
        $cutis->save();

        return redirect('/cutis');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Cuti $cuti)
    {
        $cuti->delete();
        return redirect('/cutis');
    }
}
