@extends('layout.main')
@section('title', 'Pegawai')
@section('tablename', 'Pegawai')
@section('hrefcreate', '/pegawais/create')

@section('content')
    <section class="table__body">

        <table>
            <thead>
                <tr>
                    <th> pegawai_id<span class="icon-arrow">&UpArrow;</span></th>
                    <th> manager<span class="icon-arrow">&UpArrow;</span></th>
                    <th> jabatan<span class="icon-arrow">&UpArrow;</span></th>
                    <th> nama<span class="icon-arrow">&UpArrow;</span></th>
                    <th> nohp<span class="icon-arrow">&UpArrow;</span></th>
                    <th> email<span class="icon-arrow">&UpArrow;</span></th>
                    <th> Aksi </th>
                </tr>
            </thead>
            <tbody>
                @foreach ($pegawais as $item)
                    <tr>
                        <td>{{ $item->pegawai_id }}</td>
                        <td>{{ $item->manager_id ? $item->manager_id : 'No Manager' }}</td>
                        <td>{{ $item->jabatan->nama_jabatan }}</td>
                        <td>{{ $item->nama }}</td>
                        <td>{{ $item->nohp }}</td>
                        <td>{{ $item->email }}</td>
                        <td>
                            <a href="/pegawais/{{ $item->pegawai_id }}/edit" class="myeditBtn">Edit</a>
                            <form action="/pegawais/{{ $item->pegawai_id }}" method="post">
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
