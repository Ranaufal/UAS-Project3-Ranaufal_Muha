<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('penilaian_kerjas', function (Blueprint $table) {
            $table->increments('penilaiankerja_id');
            $table->unsignedInteger('penilai_id');
            $table->foreign('penilai_id')->references('pegawai_id')->on('pegawais');
            $table->unsignedInteger('pegawai_id');
            $table->foreign('pegawai_id')->references('pegawai_id')->on('pegawais');
            $table->integer('kehadiran');
            $table->integer('kinerja');
            $table->integer('kerjasama');
            $table->integer('kreatifitas');
            $table->integer('kepemimpinan');
            $table->integer('pemecahan_masalah');
            $table->double('total');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations. 
     */
    public function down(): void
    {
        Schema::dropIfExists('penilaian_kerjas');
    }
};
