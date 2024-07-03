@extends('layout.main')
@section('title', 'Gaji')
@section('tablename', 'Gaji')
@section('hrefcreate', '/gajis/create')

@section('content')
    <section class="table__body">

        <table>
            <thead>
                <tr>
                    <th> id<span class="icon-arrow">&UpArrow;</span></th>
                    <th> pegawai<span class="icon-arrow">&UpArrow;</span></th>
                    <th> tunjangan<span class="icon-arrow">&UpArrow;</span></th>
                    <th> potongan_gaji<span class="icon-arrow">&UpArrow;</span></th>
                    <th> ket_potongan_gaji<span class="icon-arrow">&UpArrow;</span></th>
                    <th> total_gaji<span class="icon-arrow">&UpArrow;</span></th>
                    <th> Aksi </th>
                </tr>
            </thead>
            <tbody>
                @foreach ($gajis as $item)
                    <tr>
                        <td>{{ $item->gaji_id }}</td>
                        <td>{{ $item->pegawai->nama }}</td>
                        <td style="color: green">{{ $item->tunjangan }}</td>
                        <td style="color: red"> {{ $item->potongan_gaji }}</td>
                        <td style="color: red"> {{ $item->ket_potongan_gaji }}</td>
                        <td> {{ $item->total_gaji }}</td>
                        <td>
                            <a href="/gajis/{{ $item->gaji_id }}/edit" class="myeditBtn">Edit</a>
                            <form action="/gajis/{{ $item->gaji_id }}" method="post">
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
