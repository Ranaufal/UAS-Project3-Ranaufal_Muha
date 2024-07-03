@extends('layout.main')
@section('title', 'Absensi')
@section('tablename', 'Absensi')
@section('hrefcreate', '/absensis/create')

@section('content')
    <section class="table__body">
        <table>
            <thead>
                <tr>
                    <th> id<span class="icon-arrow">&UpArrow;</span></th>
                    <th> pegawai_id<span class="icon-arrow">&UpArrow;</span></th>
                    <th> tgl_absensi<span class="icon-arrow">&UpArrow;</span></th>
                    <th> status_absensi<span class="icon-arrow">&UpArrow;</span></th>
                    <th> jam_masuk<span class="icon-arrow">&UpArrow;</span></th>
                    <th> jam_keluar<span class="icon-arrow">&UpArrow;</span></th>
                    <th> Aksi </th>
                </tr>
            </thead>
            <tbody>
                @foreach ($absensis as $item)
                    <tr>
                        <td>{{ $item->absensi_id }}</td>
                        <td>{{ $item->pegawai->nama }}</td>
                        <td>{{ $item->created_at }}</td>
                        @if ($item->status_absensi == 'absence')
                            <td style="color: red">{{ $item->status_absensi }}</td>
                        @else
                            <td style="color: green">{{ $item->status_absensi }}</td>
                        @endif
                        <td>{{ $item->jam_masuk }}</td>
                        <td>{{ $item->jam_keluar }}</td>
                        <td>
                            <a href="/absensis/{{ $item->absensi_id }}/edit" class="myeditBtn">Edit</a>
                            <form action="/absensis/{{ $item->absensi_id }}" method="post">
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
