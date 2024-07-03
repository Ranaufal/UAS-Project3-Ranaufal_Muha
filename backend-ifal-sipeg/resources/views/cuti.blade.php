@extends('layout.main')
@section('title', 'Cuti')
@section('tablename', 'Cuti')
@section('hrefcreate', '/cutis/create')

@section('content')
    <section class="table__body">

        <table>
            <thead>
                <tr>
                    <th> pegawai<span class="icon-arrow">&UpArrow;</span></th>
                    <th> tgl_pengajuan<span class="icon-arrow">&UpArrow;</span></th>
                    <th> detail_cuti<span class="icon-arrow">&UpArrow;</span></th>
                    <th> lama_cuti<span class="icon-arrow">&UpArrow;</span></th>
                    <th> status_cuti<span class="icon-arrow">&UpArrow;</span></th>
                    <th> Aksi </th>
                </tr>
            </thead>
            <tbody>
                @foreach ($cutis as $item)
                    <tr>
                        <td>{{ $item->pegawai->nama }}</td>
                        <td>{{ $item->created_at }}</td>
                        <td>{{ $item->detail_cuti }}</td>
                        <td>{{ $item->lama_cuti }}</td>
                        @if ($item->status_cuti == true)
                            <td style="color: green">Disetujui</td>
                        @else
                            @if ($item->status_cuti === null)
                                <td style="color: rgb(157, 113, 30)">belum dibaca</td>
                            @else
                                <td style="color: red">Ditolak</td>
                            @endif
                        @endif
                        <td>
                            <a href="/cutis/{{ $item->cuti_id }}/edit" class="myeditBtn">Edit</a>
                            <form action="/cutis/{{ $item->cuti_id }}" method="post">
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
