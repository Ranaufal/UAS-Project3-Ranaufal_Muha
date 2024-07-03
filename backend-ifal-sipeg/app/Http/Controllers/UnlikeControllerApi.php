<?php

namespace App\Http\Controllers;

use App\Models\Unlike;

use Illuminate\Http\Request;

class UnlikeControllerApi extends Controller
{
    public function index()
    {
        return Unlike::all();
    }

    public function store(Request $request)
    {
        return Unlike::create($request->all());
    }

    public function show($id)
    {
        return Unlike::findOrFail($id);
    }

    public function update(Request $request, $id)
    {
        $Unlike = Unlike::findOrFail($id);
        $Unlike->update($request->all());

        return $Unlike;
    }

    public function destroy($id)
    {
        $Unlike = Unlike::findOrFail($id);
        $Unlike->delete();

        return 204;
    }
}
