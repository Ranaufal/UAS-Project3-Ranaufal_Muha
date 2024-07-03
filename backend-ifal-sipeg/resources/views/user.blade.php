@extends('layout.main')
@section('title', 'User')
@section('tablename', 'User')
@section('hrefcreate', '/users/create')

@section('content')
    <section class="table__body">

        <table>
            <thead>
                <tr>
                    <th> id<span class="icon-arrow">&UpArrow;</span></th>
                    <th> pegawai<span class="icon-arrow">&UpArrow;</span></th>
                    <th> email<span class="icon-arrow">&UpArrow;</span></th>
                    <th> username<span class="icon-arrow">&UpArrow;</span></th>
                    <th> password<span class="icon-arrow">&UpArrow;</span></th>
                    <th> Aksi </th>
                </tr>
            </thead>
            <tbody>
                @foreach ($users as $item)
                    <tr>
                        <td>{{ $item->user_id }}</td>
                        <td>{{ $item->pegawai->nama }}</td>
                        <td>{{ $item->pegawai->email }}</td>
                        <td>{{ $item->username }}</td>
                        <td>
                            <div style="max-width: 100px; overflow: hidden; white-space: nowrap;">
                                <p style="text-overflow: ellipsis;">{{ $item->password }}</p>
                            </div>
                        </td>
                        <td>
                            <a href="/users/{{ $item->user_id }}/edit" class="myeditBtn">Edit</a>
                            <form action="/users/{{ $item->user_id }}" method="post">
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
