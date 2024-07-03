<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Like;
use Illuminate\Support\Facades\DB;

class LikeControllerApi extends Controller
{
    public function index()
    {
        return Like::all();
    }

    public function store(Request $request)
    {
        return Like::create($request->all());
    }

    public function show($id)
    {
        return Like::findOrFail($id);
    }

    public function update(Request $request, $id)
    {
        $Like = Like::findOrFail($id);
        $Like->update($request->all());

        return $Like;
    }

    public function destroy($id)
    {
        $Like = Like::findOrFail($id);
        $Like->delete();

        return 204;
    }

    public function readTotalLike($id)
    {
        return DB::select("
        SELECT COUNT(post_id) AS likes
        FROM likes WHERE post_id = '$id'
        ");
    }
}
