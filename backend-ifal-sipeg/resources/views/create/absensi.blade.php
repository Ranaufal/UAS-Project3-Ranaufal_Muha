@extends('layout.main')
@section('title', 'Absensi')
@section('tablename', 'Absensi')
@section('hrefcreate', '#')

@section('content')
    <section class="wrapper">
        <form method="POST" action="/absensis">
            @csrf
            <div class="row">
                {{-- ================================================ --}}
                <div class="row">
                    <div class="col">
                        <h4>Pegawai</h4><br>
                        <div class="input-group">
                            <select class="form-select" name="pegawai_id">
                                @foreach ($pegawais as $index)
                                    <option value="{{ $index->pegawai_id }}">{{ $index->nama }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                </div>
                {{-- ================================================ --}}
                <div class="row">
                    <div class="col-half">
                        <h4>Jam Masuk</h4><br>
                        <div class="input-group">
                            <div class="col-third">
                                <input type="text" placeholder="Hour" name="jam_masuk_hr">
                            </div>
                            <div class="col-third">
                                <input type="text" placeholder="Minute" name="jam_masuk_mnt">
                            </div>
                            <div class="col-third">
                                <input type="text" placeholder="Seccond" name="jam_masuk_seccond">
                            </div>
                        </div>
                    </div>
                    <div class="col-half">
                        <h4>Jam Keluar</h4><br>
                        <div class="input-group">
                            <div class="col-third">
                                <input type="text" placeholder="Hour" name="jam_keluar_hr">
                            </div>
                            <div class="col-third">
                                <input type="text" placeholder="Minute" name="jam_keluar_mnt">
                            </div>
                            <div class="col-third">
                                <input type="text" placeholder="Seccond" name="jam_keluar_seccond">
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
