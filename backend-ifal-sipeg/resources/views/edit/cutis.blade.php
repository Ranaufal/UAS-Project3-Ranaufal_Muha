@extends('layout.main')
@section('title', 'Cuti')
@section('tablename', 'Cuti')
@section('hrefcreate', '/cutis/create')

@section('content')
    <section class="wrapper">
        <h1 align=center>Edit Cuti</h1><br><br>
        <form method="POST" action="/cutis/{{ $cutis->cuti_id }}">
            @method('PUT')
            @csrf
            <div class="row">
                <div class="row">
                    <h4>Pegawai</h4><br>
                    <div class="input-group">
                        <select class="form-select" name="pegawai_id" disabled>
                            <option value="{{ $cutis->pegawai_id }}">{{ $cutis->pegawai->nama }}</option>
                        </select>
                    </div>
                </div>
                <div class="input-group input-group-icon">
                    <input type="text" placeholder="Detail Cuti" name="detail_cuti" value="{{ $cutis->detail_cuti }}">
                    <div class="input-icon">
                        <i class="fa fa-user"></i>
                    </div>
                </div>
                <div class="row">
                    <div class="col-half">
                        <h4>Tanggal Mulai</h4><br>
                        <div class="input-group">
                            <div class="col-third">
                                <input type="text" placeholder="DD" name="day-mulai">
                            </div>
                            <div class="col-third">
                                <input type="text" placeholder="MM" name="month-mulai">
                            </div>
                            <div class="col-third">
                                <input type="text" placeholder="YYYY" name="year-mulai">
                            </div>
                        </div>
                    </div>
                    <div class="col-half">
                        <h4>Tanggal Selesai</h4><br>
                        <div class="input-group">
                            <div class="col-third">
                                <input type="text" placeholder="DD" name="day-selesai">
                            </div>
                            <div class="col-third">
                                <input type="text" placeholder="MM" name="month-selesai">
                            </div>
                            <div class="col-third">
                                <input type="text" placeholder="YYYY" name="year-selesai">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="input-group">
                        <select class="form-select" name="status_cuti">
                            <option value="1">Cuti Di Terima</option>
                            <option value="0">Cuti Di Tolak</option>
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
