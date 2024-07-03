@extends('layout.main')
@section('title', 'Cuti')
@section('tablename', 'Cuti')
@section('hrefcreate', '#')

@section('content')
    <section class="wrapper">
        <form method="POST" action="/cutis">
            @csrf
            <div class="row">
                <div class="row">
                    <h4>Pegawai</h4><br>
                    <div class="input-group">
                        <select class="form-select" name="pegawai_id">
                            @foreach ($pegawais as $index)
                                <option value="{{ $index->pegawai_id }}">{{ $index->nama }}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
                <div class="input-group input-group-icon">
                    <input type="text" placeholder="Detail Cuti" name="detail_cuti">
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

            </div>
            <div class="row">
                <div class="input-group input-group-icon">
                    <input type="submit" class="mysubmitBtn" placeholder="">
                </div>
            </div>
        </form>
    </section>

@endsection()
