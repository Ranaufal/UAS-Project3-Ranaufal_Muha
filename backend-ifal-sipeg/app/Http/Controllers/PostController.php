<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use App\Http\Requests\StorePostRequest;
use App\Http\Requests\UpdatePostRequest;
use App\Models\Post;
use App\Models\User;

class PostController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $posts = Post::all();
        $likeCounts = [];
        $unlikeCounts = [];
        $commentCounts = [];
        foreach ($posts as $post) {
            $likeCounts[$post->post_id] = DB::table('likes')->where('post_id', $post->post_id)->count();
            $unlikeCounts[$post->post_id] = DB::table('unlikes')->where('post_id', $post->post_id)->count();
            $commentCounts[$post->post_id] = DB::table('comments')->where('post_id', $post->post_id)->count();
        }
        return view('postingan', [
            'posts' => $posts,
            'likeCounts' => $likeCounts,
            'unlikeCounts' => $unlikeCounts,
            'commentCounts' => $commentCounts,
        ]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view(
            'create.postingan',
            [
                'users' => User::all(),
            ],
        );
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StorePostRequest $request)
    {
        $validatedData = $request->validate([
            'user_id' => 'required',
            'url_content' => '',
            'text_content' => '',
        ]);

        // Mendapatkan file yang diunggah
        $photo = $request->file('url_content');

        // Membuat nama file unik dengan menambahkan timestamp ke nama asli file
        $postName = time() . '_' . $validatedData['user_id'] . '.' . $photo->getClientOriginalExtension();

        // Memindahkan file ke direktori yang diinginkan
        $photo->move('assets/posts', $postName);

        // Membuat path yang bisa diakses publik
        $publicPath = 'assets/posts/' . $postName;

        try {
            $newpost = new Post();
            $newpost->user_id = $validatedData['user_id'];
            $newpost->url_content =  $publicPath;
            // $newpost->text_content = $validatedData['text_content'];
            $newpost->text_content = $request->input('text_content');

            $newpost->save();

            return redirect('/postingans');
        } catch (\Exception $e) {
            return back()->withError('Error occurred while uploading image.');
        }
        // $publicPath = Storage::url($postPath);
    }

    /**
     * Display the specified resource.
     */
    public function show(Post $post)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(String $id)
    {
        // dd($post);
        return view(
            'edit.postingan',
            [
                'post' => Post::find($id),
            ],
        );
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdatePostRequest $request, string $id)
    {
        try {
            // Mendapatkan data postingan yang akan diubah
            $post = Post::findOrFail($id);

            // Validasi data yang diterima dari formulir
            $validatedData = $request->validate([
                'url_content' => 'nullable',
                'text_content' => '',
            ]);

            // Jika ada file yang diunggah
            if ($request->hasFile('url_content')) {
                // Mendapatkan file yang diunggah
                $photo = $request->file('url_content');
                // dd($validatedData);

                // Membuat nama file unik dengan menambahkan timestamp ke nama asli file
                $postName = time() . '_' . $post->user_id . '.' . $photo->getClientOriginalExtension();

                // Memindahkan file ke direktori yang diinginkan
                $photo->move('assets/posts', $postName);

                // Membuat path yang bisa diakses publik
                $publicPath = 'assets/posts/' . $postName;
                $validatedData['url_content'] = $publicPath;
            } else {
                // Jika tidak ada file yang diunggah, gunakan url_content yang ada
                $validatedData['url_content'] = $post->url_content;
            }

            // Memperbarui data postingan
            $post->update($validatedData);

            return redirect('/postingans');
        } catch (\Illuminate\Database\Eloquent\ModelNotFoundException $e) {
            return back()->withError('Post not found.');
        } catch (\Exception $e) {
            return back()->withError('Error occurred while updating post.');
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        Post::destroy($id);
        return redirect('/postingans');
    }
}
