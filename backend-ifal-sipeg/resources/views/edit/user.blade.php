@extends('layout.main')
@section('title', 'User')
@section('tablename', 'User')
@section('hrefcreate', '#')

@section('content')
    <section class="wrapper">
        <form method="POST" action="/users/{{ $user->user_id }}">
            @method('PUT')
            @csrf
            <div class="row">
                <div class="row">
                    <h4>Pegawai</h4><br>
                    <div class="input-group">
                        <select class="form-select" name="pegawai_id" disabled>
                            <option value="{{ $user->pegawai_id }}">{{ $user->pegawai->nama }}</option>
                        </select>
                    </div>
                </div>
                <div class="row">
                    <div class="input-group input-group-icon">
                        <input type="text" placeholder="Username" name="username" value="{{ $user->username }}">
                        <div class="input-icon">
                            <i class="fa fa-key"></i>
                        </div>
                    </div>
                </div>
                {{-- ================================================ --}}
                <div class="row">
                    <div class="col-half">
                        <div class="input-group input-group-icon">
                            <input type="password" placeholder="Password" name="password">
                            <div class="input-icon">
                                <i class="fa fa-key"></i>
                            </div>
                        </div>
                    </div>
                    <div class="col-half">
                        <div class="input-group input-group-icon">
                            <input type="password" placeholder="Confirm Password" name="confirm_password">
                            <div class="input-icon">
                                <i class="fa fa-key"></i>
                            </div>
                        </div>
                    </div>
                </div>
                {{-- ================================================ --}}
                <div class="row">
                    <h4>Hak Akses</h4><br>
                    <div class="input-group">
                        <select class="form-select" name="hak_akses">
                            @if ($user->hak_akses == 1)
                                <option value="1" selected>Full Akses</option>
                                <option value="2">Manager</option>
                            @elseif($user->hak_akses == 2)
                                <option value="1">Full Akses</option>
                                <option value="2" selected>Manager</option>
                                <option value="3">Pegawai</option>
                            @endif
                        </select>
                    </div>
                </div>
                {{-- ================================================ --}}
                {{-- <div class="input-group input-group-icon">
                    <input type="number" placeholder="Gaji Pokok" name="gaji_pokok">
                    <div class="input-icon">
                        <i class="fa fa-key"></i>
                    </div>
                </div> --}}

            </div>
            <div class="row">
                <div class="input-group input-group-icon">
                    <input type="submit" class="mysubmitBtn" placeholder="">
                </div>
            </div>
        </form>
    </section>

@endsection()
