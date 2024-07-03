@extends('layout.main')
@section('title', 'Postingan')
@section('tablename', 'Postingan')
@section('hrefcreate', '/postingans/create')

@section('content')
    <section class="wrapper">
        <form method="POST" action="/postingans" enctype="multipart/form-data">
            @csrf
            <div class="row">
                {{-- ================================================ --}}
                <div class="row">
                    <div class="col">
                        <h4>Usernames</h4><br>
                        <div class="input-group">
                            <select class="form-select" name="user_id">
                                @foreach ($users as $index)
                                    <option value="{{ $index->user_id }}">{{ $index->username }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                </div>
                {{-- ================================================ --}}
                <div class="row">
                    <div class="col">
                        <h4>Post</h4><br>
                        <div class="input-group">
                            <input type="file" name="url_content" accept="image/jpg/jpeg/png">
                        </div>
                    </div>
                </div>
                {{-- ================================================ --}}
                <div class="row">
                    <div class="col">
                        <h4>Description</h4><br>
                        <div class="input-group">
                            <textarea name="text_content" style="width: 100%" id="" cols="30" rows="10"></textarea>
                        </div>
                    </div>
                </div>
            </div>
            {{-- ================================================ --}}
            <div class="row">
                <div class="input-group input-group-icon">
                    <input type="submit" class="mysubmitBtn" placeholder="">
                </div>
            </div>
        </form>
    </section>

@endsection()
