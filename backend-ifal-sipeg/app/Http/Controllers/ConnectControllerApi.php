<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Connect;

class ConnectControllerApi extends Controller
{
    public function index()
    {
        return Connect::all();
    }

    public function store(Request $request)
    {
        return Connect::create($request->all());
    }

    public function show($id)
    {
        return Connect::findOrFail($id);
    }

    public function update(Request $request, $id)
    {
        $Connect = Connect::findOrFail($id);
        $Connect->update($request->all());

        return $Connect;
    }

    public function destroy($id)
    {
        $Connect = Connect::findOrFail($id);
        $Connect->delete();

        return 204;
    }
}
