<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Post;
use Illuminate\Support\Facades\DB;

class PostControllerApi extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return Post::all();
    }

    public function store(Request $request)
    {
        return Post::create($request->all());
    }

    public function show($id)
    {
        return Post::findOrFail($id);
    }

    public function update(Request $request, $id)
    {
        $Post = Post::findOrFail($id);
        $Post->update($request->all());

        return $Post;
    }

    public function destroy($id)
    {
        $Post = Post::findOrFail($id);
        $Post->delete();

        return 204;
    }

    public function userPost()
    {
        return DB::select("
        SELECT 
        p.post_id,
        u.username,
        j.nama_jabatan,
        u.url_profile,
        p.url_content,
        p.text_content,
        COUNT(l.like_id) AS likes,
        COUNT(unlikes_id) AS unlikes,
        COUNT(comment_id) AS comments,
        DATE(p.created_at) AS created_at

        FROM 
        posts p join users u using (user_id) 
        join pegawais pgw using (pegawai_id) 
        join jabatans j using(jabatan_id) 
        left join likes l using(post_id)
        left join unlikes using(post_id) 
        left join comments using(post_id) 
 
        GROUP BY 
        p.post_id,
        u.username,
        j.nama_jabatan,
        u.url_profile,
        p.url_content,
        p.text_content,
        created_at

        ORDER BY created_at DESC

    ");
    }

    public function uniqueUserPost($id)
    {
        return DB::select("
        SELECT 
        p.post_id,
        u.username,
        j.nama_jabatan,
        u.url_profile,
        p.url_content,
        p.text_content,
        COUNT(l.like_id) AS likes,
        COUNT(unlikes_id) AS unlikes,
        COUNT(comment_id) AS comments,
        DATE(p.created_at) AS created_at

        FROM 
        posts p join users u using (user_id) 
        join pegawais pgw using (pegawai_id) 
        join jabatans j using(jabatan_id) 
        left join likes l using(post_id)
        left join unlikes using(post_id) 
        left join comments using(post_id) 
 
        WHERE u.user_id = ?

        GROUP BY 
        p.post_id,
        u.username,
        j.nama_jabatan,
        u.url_profile,
        p.url_content,
        p.text_content,
        created_at

        ORDER BY created_at DESC

    ", [
            $id
        ]);
    }
}
