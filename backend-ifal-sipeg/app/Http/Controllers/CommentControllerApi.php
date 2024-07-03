<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Comment;

class CommentControllerApi extends Controller
{
    public function index()
    {
        return Comment::all();
    }

    public function store(Request $request)
    {
        return Comment::create($request->all());
    }

    public function show($id)
    {
        return Comment::findOrFail($id);
    }

    public function update(Request $request, $id)
    {
        $Comment = Comment::findOrFail($id);
        $Comment->update($request->all());

        return $Comment;
    }

    public function destroy($id)
    {
        $Comment = Comment::findOrFail($id);
        $Comment->delete();

        return 204;
    }
}
