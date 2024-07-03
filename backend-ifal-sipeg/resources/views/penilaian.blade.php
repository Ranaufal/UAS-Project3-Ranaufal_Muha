@extends('layout.main')
@section('title', 'Penilaian Kerja')
@section('tablename', 'Penilaian Kerja')
@section('hrefcreate', '/penilaian_kerjas/create')

@section('content')
    <section class="table__body">
        <table>
            <thead>
                <tr>
                    <th> id<span class="icon-arrow">&UpArrow;</span></th>
                    <th> pegawai<span class="icon-arrow">&UpArrow;</span></th>
                    <th> penilai<span class="icon-arrow">&UpArrow;</span></th>
                    <th> periode_penilaian<span class="icon-arrow">&UpArrow;</span></th>
                    <th> nilai_kinerja<span class="icon-arrow">&UpArrow;</span></th>
                    <th> Aksi </th>
                </tr>
            </thead>
            <tbody>
                @foreach ($penilaians as $item)
                    <tr>
                        <td>{{ $item->penilaiankerja_id }}</td>
                        <td>{{ $item->pegawai->nama }}</td>
                        <td>{{ $item->penilai->nama }}</td>
                        <td>{{ $item->created_at }}</td>
                        <td>{{ $item->total }}</td>
                        <td>
                            <a href="/penilaian_kerjas/{{ $item->penilaiankerja_id }}/edit" class="myeditBtn">Edit</a>
                            <form action="/penilaian_kerjas/{{ $item->penilaiankerja_id }}" method="post">
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
