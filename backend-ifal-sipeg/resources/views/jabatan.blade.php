@extends('layout.main')
@section('title', 'Jabatan')
@section('tablename', 'Jabatan')
@section('hrefcreate', '/jabatans/create')

@section('content')
    <section class="table__body">

        <table>
            <thead>
                <tr>
                    <th> id<span class="icon-arrow">&UpArrow;</span></th>
                    <th> nama_jabatan<span class="icon-arrow">&UpArrow;</span></th>
                    <th> deskripsi<span class="icon-arrow">&UpArrow;</span></th>
                    <th> gaji_pokok<span class="icon-arrow">&UpArrow;</span></th>
                    <th> Aksi </th>
                </tr>
            </thead>
            <tbody>
                @foreach ($jabatans as $item)
                    <tr>
                        <td>{{ $item->jabatan_id }}</td>
                        <td>{{ $item->nama_jabatan }}</td>
                        <td>{{ $item->deskripsi }}</td>
                        <td>{{ $item->gaji_pokok }}</td>
                        <td>
                            <a href="/jabatans/{{ $item->jabatan_id }}/edit" class="myeditBtn">Edit</a>
                            <form action="/jabatans/{{ $item->jabatan_id }}" method="post">
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
