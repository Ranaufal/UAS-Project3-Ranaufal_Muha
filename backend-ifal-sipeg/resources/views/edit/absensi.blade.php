@extends('layout.main')
@section('title', 'Absensi')
@section('tablename', 'Absensi')
@section('hrefcreate', '/absensis/create')

@section('content')
    <section class="wrapper">
        <form method="POST" action="/absensis/{{ $absensi->pegawai_id }}">
            @method('PUT')
            @csrf
            <div class="row">
                {{-- ================================================ --}}
                <div class="row">
                    <div class="col">
                        <h4>Pegawai</h4><br>
                        <div class="input-group">
                            <select class="form-select" name="pegawai_id" disabled>
                                <option value="{{ $absensi->pegawai_id }}">{{ $absensi->pegawai->nama }}</option>
                            </select>
                        </div>
                    </div>
                </div>
                {{-- ================================================ --}}
                <div class="row">
                    <div class="col-half">
                        <h4>Jam Masuk</h4><br>
                        <div class="input-group">
                            <div class="">
                                <input type="text" placeholder="Jam Masuk" name="jam_masuk"
                                    value="{{ $absensi->jam_masuk }}">
                            </div>
                        </div>
                    </div>
                    <div class="col-half">
                        <h4>Jam Keluar</h4><br>
                        <div class="input-group">
                            <div class="">
                                <input type="text" placeholder="Jam Keluar" name="jam_keluar"
                                    value="{{ $absensi->jam_keluar }}">
                            </div>
                        </div>
                    </div>
                </div>
                {{-- ================================================ --}}
                <div class="input-group input-group-icon">
                    <div class="input-group">
                        <select class="form-select" name="status_absensi">
                            <option value="present">Present</option>
                            <option value="absence">Absence</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="input-group input-group-icon">
                    <input type="submit" class="mysubmitBtn" placeholder="">
                </div>
            </div>
        </form>
    </section>

@endsection()
