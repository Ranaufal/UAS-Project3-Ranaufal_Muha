<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Jabatan;

class JabatanControllerApi extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return Jabatan::all();
    }

    public function store(Request $request)
    {
        return Jabatan::create($request->all());
    }

    public function show($id)
    {
        return Jabatan::findOrFail($id);
    }

    public function update(Request $request, $id)
    {
        $Jabatan = Jabatan::findOrFail($id);
        $Jabatan->update($request->all());

        return $Jabatan;
    }

    public function destroy($id)
    {
        $Jabatan = Jabatan::findOrFail($id);
        $Jabatan->delete();

        return 204;
    }
}
