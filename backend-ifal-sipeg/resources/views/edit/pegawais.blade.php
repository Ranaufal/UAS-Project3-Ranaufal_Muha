@extends('layout.main')
@section('title', 'Pegawai')
@section('tablename', 'Pegawai')
@section('hrefcreate', '#')

@section('content')
    <section class="wrapper">
        <h1 align=center>Edit Pegawai</h1><br><br>
        <div class="container">
            <form method="POST" action="/pegawais/{{ $pegawai->pegawai_id }}">
                @method('PUT')
                @csrf
                <div class="row">
                    <div class="input-group input-group-icon">
                        <input type="text" placeholder="Full Name" name="nama" value="{{ $pegawai->nama }}">
                        <div class="input-icon">
                            <i class="fa fa-user"></i>
                        </div>
                    </div>
                    <div class="input-group input-group-icon">
                        <input type="email" placeholder="Email Address" name="email" value="{{ $pegawai->email }}">
                        <div class="input-icon">
                            <i class="fa fa-envelope"></i>
                        </div>
                    </div>
                    <div class="input-group input-group-icon">
                        <input type="text" placeholder="No Hp" name="nohp" value="{{ $pegawai->nohp }}">
                        <div class="input-icon">
                            <i class="fa fa-key"></i>
                        </div>
                    </div>
                    <div class="input-group input-group-icon">
                        <input type="text" placeholder="Alamat" name="alamat" value="{{ $pegawai->alamat }}">
                        <div class="input-icon">
                            <i class="fa fa-key"></i>
                        </div>
                    </div>
                </div>

                <div class="row">
                    {{-- ================================================ --}}
                    <div class="col-half">
                        <h4>Jabatan</h4><br>
                        <div class="input-group">
                            <select class="form-select" name="jabatan_id">
                                @foreach ($jabatans as $index)
                                    @if ($index->jabatan_id == $pegawai->jabatan_id)
                                        <option value="{{ $index->jabatan_id }}" selected>{{ $index->nama_jabatan }}
                                        </option>
                                    @else
                                        <option value="{{ $index->jabatan_id }}">{{ $index->nama_jabatan }}</option>
                                    @endif
                                @endforeach
                            </select>
                        </div>
                    </div>
                    {{-- ================================================ --}}
                    {{-- <div class="col-half">
                        <h4>Tanggal Masuk</h4><br>
                        <div class="input-group">
                            <div class="col-third">
                                <input type="text" placeholder="DD" name="tgl_masuk_day">
                            </div>
                            <div class="col-third">
                                <input type="text" placeholder="MM" name="tgl_masuk_month">
                            </div>
                            <div class="col-third">
                                <input type="text" placeholder="YYYY" name="tgl_masuk_year">
                            </div>
                        </div>
                    </div> --}}
                </div>
                <div class="row">
                    <div class="input-group input-group-icon">
                        <input type="submit" class="mysubmitBtn" placeholder="">
                    </div>
                </div>
            </form>
        </div>

    </section>

@endsection()
