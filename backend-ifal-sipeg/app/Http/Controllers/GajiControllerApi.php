<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Gaji;

class GajiControllerApi extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return Gaji::all();
    }

    public function store(Request $request)
    {
        return Gaji::create($request->all());
    }

    public function show($id)
    {
        return Gaji::findOrFail($id);
    }

    public function update(Request $request, $id)
    {
        $Gaji = Gaji::findOrFail($id);
        $Gaji->update($request->all());

        return $Gaji;
    }

    public function destroy($id)
    {
        $Gaji = Gaji::findOrFail($id);
        $Gaji->delete();

        return 204;
    }
}
