@extends('layout.main')
@section('title', 'Penilaian Kerja')
@section('tablename', 'Penilaian Kerja')
@section('hrefcreate', '/penilaian_kerjas/create')

@section('content')
    <section class="wrapper">
        <form method="POST" action="/penilaian_kerjas/{{ $penilaian->penilaiankerja_id }}">
            @method('PUT')
            @csrf
            <div class="row">
                {{-- ================================================ --}}
                <div class="row">
                    <div class="col">
                        <h4>Pegawai</h4><br>
                        <div class="input-group">
                            <select class="form-select" name="pegawai_id" disabled>
                                <option value="{{ $penilaian->pegawai_id }}">{{ $penilaian->pegawai->nama }}</option>
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
                            @if ($penilaian->kehadiran == $i)
                                <input type="radio" id="kehadiran{{ $i }}" name="kehadiran"
                                    value="{{ $i }}" checked>
                                <label for="kehadiran{{ $i }}">{{ $i }}</label>
                            @else
                                <input type="radio" id="kehadiran{{ $i }}" name="kehadiran"
                                    value="{{ $i }}">
                                <label for="kehadiran{{ $i }}">{{ $i }}</label>
                            @endif
                            <br>
                        @endfor
                    </div>
                </div>
                <br>
                <div class="row-penilaian">
                    <h4>Kinerja</h4>
                    <div class="row-penilaian">
                        @for ($i = 1; $i <= 10; $i++)
                            <div class="penilaian-width"></div>
                            @if ($penilaian->kinerja == $i)
                                <input type="radio" id="kinerja{{ $i }}" name="kinerja"
                                    value="{{ $i }}" checked>
                                <label for="kinerja{{ $i }}">{{ $i }}</label>
                            @else
                                <input type="radio" id="kinerja{{ $i }}" name="kinerja"
                                    value="{{ $i }}">
                                <label for="kinerja{{ $i }}">{{ $i }}</label>
                            @endif
                            <br>
                        @endfor
                    </div>
                </div>
                <br>
                <div class="row-penilaian">
                    <h4>Kerjasama</h4>
                    <div class="row-penilaian">
                        @for ($i = 1; $i <= 10; $i++)
                            <div class="penilaian-width"></div>
                            @if ($penilaian->kerjasama == $i)
                                <input type="radio" id="kerjasama{{ $i }}" name="kerjasama"
                                    value="{{ $i }}" checked>
                                <label for="kerjasama{{ $i }}">{{ $i }}</label>
                            @else
                                <input type="radio" id="kerjasama{{ $i }}" name="kerjasama"
                                    value="{{ $i }}">
                                <label for="kerjasama{{ $i }}">{{ $i }}</label>
                            @endif
                            <br>
                        @endfor
                    </div>
                </div>
                <br>
                <div class="row-penilaian">
                    <h4>Kreatifitas</h4>
                    <div class="row-penilaian">
                        @for ($i = 1; $i <= 10; $i++)
                            <div class="penilaian-width"></div>
                            @if ($penilaian->kreatifitas == $i)
                                <input type="radio" id="kreativitas{{ $i }}" name="kreatifitas"
                                    value="{{ $i }}" checked>
                                <label for="kreativitas{{ $i }}">{{ $i }}</label>
                            @else
                                <input type="radio" id="kreativitas{{ $i }}" name="kreatifitas"
                                    value="{{ $i }}">
                                <label for="kreativitas{{ $i }}">{{ $i }}</label>
                            @endif
                            <br>
                        @endfor
                    </div>
                </div>
                <br>
                <div class="row-penilaian">
                    <h4>Kepemimpinan</h4>
                    <div class="row-penilaian">
                        @for ($i = 1; $i <= 10; $i++)
                            <div class="penilaian-width"></div>
                            @if ($penilaian->kepemimpinan == $i)
                                <input type="radio" id="kepemimpinan{{ $i }}" name="kepemimpinan"
                                    value="{{ $i }}" checked>
                                <label for="kepemimpinan{{ $i }}">{{ $i }}</label>
                            @else
                                <input type="radio" id="kepemimpinan{{ $i }}" name="kepemimpinan"
                                    value="{{ $i }}">
                                <label for="kepemimpinan{{ $i }}">{{ $i }}</label>
                            @endif
                            <br>
                        @endfor
                    </div>
                </div>
                <br>
                <div class="row-penilaian">
                    <h4>Pemecahan Masalah</h4>
                    <div class="row-penilaian">
                        @for ($i = 1; $i <= 10; $i++)
                            <div class="penilaian-width"></div>
                            @if ($penilaian->pemecahan_masalah == $i)
                                <input type="radio" id="pemecahan_masalah{{ $i }}" name="pemecahan_masalah"
                                    value="{{ $i }}" checked>
                                <label for="pemecahan_masalah{{ $i }}">{{ $i }}</label>
                            @else
                                <input type="radio" id="pemecahan_masalah{{ $i }}" name="pemecahan_masalah"
                                    value="{{ $i }}">
                                <label for="pemecahan_masalah{{ $i }}">{{ $i }}</label>
                            @endif
                            <br>
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
