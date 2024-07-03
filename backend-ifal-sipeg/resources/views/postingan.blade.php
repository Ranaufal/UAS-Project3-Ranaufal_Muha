@extends('layout.main')
@section('title', 'Postingan')
@section('tablename', 'Postingan')
@section('hrefcreate', '/postingans/create')

@section('content')
    <section class="table__body">
        <table>
            <thead>
                <tr>
                    <th> Id<span class="icon-arrow">&UpArrow;</span></th>
                    <th> username<span class="icon-arrow">&UpArrow;</span></th>
                    <th> Posts<span class="icon-arrow">&UpArrow;</span></th>
                    <th> Likes<span class="icon-arrow">&UpArrow;</span></th>
                    <th> Unlikes<span class="icon-arrow">&UpArrow;</span></th>
                    <th> Comments<span class="icon-arrow">&UpArrow;</span></th>
                    <th> Aksi </th>
                </tr>
            </thead>
            <tbody>
                @foreach ($posts as $item)
                    <tr>
                        <td>{{ $item->post_id }}</td>
                        <td>{{ $item->user->username }}</td>
                        <td><img src="{{ $item->url_content }}" alt=""></td>
                        <td>{{ $likeCounts[$item->post_id] }}</td>
                        <td>{{ $unlikeCounts[$item->post_id] }}</td>
                        <td>{{ $commentCounts[$item->post_id] }}</td>
                        <td>
                            <a href="/postingans/{{ $item->post_id }}/edit" class="myeditBtn">Edit</a>
                            <form action="/postingans/{{ $item->post_id }}" method="post">
                                @method('DELETE')
                                @csrf
                                <button type="submit" class="mydeleteBtn">Delete</button>
                            </form>
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </section>
@endsection()
