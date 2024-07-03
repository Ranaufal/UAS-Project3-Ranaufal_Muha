@extends('layout.main')
@section('title', 'Gaji')
@section('tablename', 'Gaji')
@section('hrefcreate', '#')

@section('content')
    <section class="wrapper">
        <h1 align=center>Edit Gaji</h1><br><br>
        <form method="POST" action="/gajis/{{ $gajis->gaji_id }}">
            @method('PUT')
            @csrf
            <div class="row">
                {{-- ================================================ --}}
                <div class="row">
                    <div class="col">
                        <h4>Pegawai</h4><br>
                        <div class="input-group">
                            <select class="form-select" name="pegawai_id">
                                <option value="{{ $gajis->pegawai_id }}" selected>
                                    {{ $gajis->pegawai->nama }}</option>
                            </select>
                        </div>
                    </div>
                    {{-- <div class="col-half">
                        <h4>Tanggal Masuk</h4><br>
                        <div class="input-group">
                            <div class="col-third">
                                <input type="text" placeholder="DD" name="day">
                            </div>
                            <div class="col-third">
                                <input type="text" placeholder="MM" name="month">
                            </div>
                            <div class="col-third">
                                <input type="text" placeholder="YYYY" name="year">
                            </div>
                        </div>
                    </div> --}}
                </div>
                {{-- ================================================ --}}
                <div class="input-group input-group-icon">
                    <input type="text" placeholder="Tunjangan" name="tunjangan" value="{{ $gajis->tunjangan }}">
                    <div class="input-icon">
                        <i class="fa fa-envelope"></i>
                    </div>
                </div>
                {{-- ================================================ --}}
                <h4>Potongan Gaji</h4><br>
                <?php
                $list = ['Pinjaman Koperasi', 'Asuransi', 'Potongan Kehadiran'];
                ?>
                @for ($i = 0; $i < count($list); $i++)
                    <div class="row">
                        <div class="col-half">
                            <div class="input-group-icon">
                                <input type="text" placeholder="{{ $list[$i] }}" value="{{ $list[$i] }}"
                                    style="background-color: rgb(182, 182, 182); border: 0; color: black;" disabled>
                            </div>
                        </div>
                        <div class="col-half">
                            <div class="input-group input-group-icon">
                                <input type="number" placeholder="Potongan gaji" name="potongan_gaji{{ $i }}">
                                <div class="input-icon">
                                    <i class="fa fa-key"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                @endfor
            </div>
            <div class="row">
                <div class="input-group input-group-icon">
                    <input type="submit" class="mysubmitBtn" placeholder="">
                </div>
            </div>
        </form>
    </section>

@endsection()
