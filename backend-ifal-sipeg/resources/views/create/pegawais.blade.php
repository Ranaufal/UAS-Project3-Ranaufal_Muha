@extends('layout.main')
@section('title', 'Pegawai')
@section('tablename', 'Pegawai')
@section('hrefcreate', '#')

@section('content')
    <section class="wrapper">
        <div class="container">
            <form method="POST" action="/pegawais">
                @csrf
                <div class="row">
                    <div class="input-group input-group-icon">
                        <input type="text" placeholder="Full Name" name="nama">
                        <div class="input-icon">
                            <i class="fa fa-user"></i>
                        </div>
                    </div>
                    <div class="input-group input-group-icon">
                        <input type="email" placeholder="Email Address" name="email">
                        <div class="input-icon">
                            <i class="fa fa-envelope"></i>
                        </div>
                    </div>
                    <div class="input-group input-group-icon">
                        <input type="text" placeholder="No Hp" name="nohp">
                        <div class="input-icon">
                            <i class="fa fa-key"></i>
                        </div>
                    </div>
                    <div class="input-group input-group-icon">
                        <input type="text" placeholder="Alamat" name="alamat">
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
                                    <option value="{{ $index->jabatan_id }}">{{ $index->nama_jabatan }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    {{-- ================================================ --}}
                    <div class="col-half">
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
                    </div>
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

{{-- checkbox
<div class="col-half">
    <h4>Gender</h4>
    <div class="input-group">
        <input id="gender-male" type="radio" name="gender" value="male">
        <label for="gender-male">Male</label>
        <input id="gender-female" type="radio" name="gender" value="female">
        <label for="gender-female">Female</label>
    </div>
</div> --}}


{{-- <div class="row">
    <h4>Payment Details</h4>
    <div class="input-group">
        <input id="payment-method-card" type="radio" name="payment-method" value="card" checked>
        <label for="payment-method-card">
            <span><i class="fa fa-cc-visa"></i> Credit Card</span>
        </label>
        <input id="payment-method-paypal" type="radio" name="payment-method" value="paypal">
        <label for="payment-method-paypal">
            <span><i class="fa fa-cc-paypal"></i> Paypal</span>
        </label>
    </div>
    <div class="input-group input-group-icon">
        <input type="text" placeholder="Card Number">
        <div class="input-icon">
            <i class="fa fa-credit-card"></i>
        </div>
    </div>
    <div class="col-half">
        <div class="input-group input-group-icon">
            <input type="text" placeholder="Card CVC">
            <div class="input-icon">
                <i class="fa fa-user"></i>
            </div>
        </div>
    </div>
    <div class="col-half">
        <div class="input-group">
            <select>
                <option>01 Jan</option>
                <option>02 Jan</option>
            </select>
            <select>
                <option>2015</option>
                <option>2016</option>
            </select>
        </div>
    </div>
</div> --}}
