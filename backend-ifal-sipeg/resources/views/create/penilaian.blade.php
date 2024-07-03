@extends('layout.main')
@section('title', 'Penilaian Kerja')
@section('tablename', 'Penilaian Kerja')
@section('hrefcreate', '#')

@section('content')
    <section class="wrapper">
        <form method="POST" action="/penilaian_kerjas">
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
                <br>
                <hr> <br> <br>
                <div class="row-penilaian">
                    <h4>Kehadiran</h4>
                    <div class="row-penilaian">
                        @for ($i = 1; $i <= 10; $i++)
                            <div class="penilaian-width"></div>
                            <input type="radio" id="kehadiran{{ $i }}" name="kehadiran"
                                value="{{ $i }}">
                            <label for="kehadiran{{ $i }}">{{ $i }}</label><br>
                        @endfor
                    </div>
                </div>
                <br>
                <div class="row-penilaian">
                    <h4>Kinerja</h4>
                    <div class="row-penilaian">
                        @for ($i = 1; $i <= 10; $i++)
                            <div class="penilaian-width"></div>
                            <input type="radio" id="kinerja{{ $i }}" name="kinerja"
                                value="{{ $i }}">
                            <label for="kinerja{{ $i }}">{{ $i }}</label><br>
                        @endfor
                    </div>
                </div>
                <br>
                <div class="row-penilaian">
                    <h4>Kerjasama</h4>
                    <div class="row-penilaian">
                        @for ($i = 1; $i <= 10; $i++)
                            <div class="penilaian-width"></div>
                            <input type="radio" id="kerjasama{{ $i }}" name="kerjasama"
                                value="{{ $i }}">
                            <label for="kerjasama{{ $i }}">{{ $i }}</label><br>
                        @endfor
                    </div>
                </div>
                <br>
                <div class="row-penilaian">
                    <h4>Kreativitas</h4>
                    <div class="row-penilaian">
                        @for ($i = 1; $i <= 10; $i++)
                            <div class="penilaian-width"></div>
                            <input type="radio" id="kreativitas{{ $i }}" name="kreatifitas"
                                value="{{ $i }}">
                            <label for="kreativitas{{ $i }}">{{ $i }}</label><br>
                        @endfor
                    </div>
                </div>
                <br>
                <div class="row-penilaian">
                    <h4>Kepemimpinan</h4>
                    <div class="row-penilaian">
                        @for ($i = 1; $i <= 10; $i++)
                            <div class="penilaian-width"></div>
                            <input type="radio" id="kepemimpinan{{ $i }}" name="kepemimpinan"
                                value="{{ $i }}">
                            <label for="kepemimpinan{{ $i }}">{{ $i }}</label><br>
                        @endfor
                    </div>
                </div>
                <br>
                <div class="row-penilaian">
                    <h4>Pemecahan Masalah</h4>
                    <div class="row-penilaian">
                        @for ($i = 1; $i <= 10; $i++)
                            <div class="penilaian-width"></div>
                            <input type="radio" id="pemecahan_masalah{{ $i }}" name="pemecahan_masalah"
                                value="{{ $i }}">
                            <label for="pemecahan_masalah{{ $i }}">{{ $i }}</label><br>
                        @endfor
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
