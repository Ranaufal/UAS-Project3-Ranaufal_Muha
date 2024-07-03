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
        Schema::create('pegawais', function (Blueprint $table) {
            $table->increments('pegawai_id');
            $table->unsignedInteger('manager_id')->nullable();
            $table->foreign('manager_id')->references('pegawai_id')->on('pegawais');
            $table->string('nama', 100);
            $table->string('nohp', 20);
            $table->string('alamat');
            $table->string('email', 50)->unique();
            $table->date('tgl_masuk');
            $table->date('tgl_keluar')->nullable();
            $table->unsignedInteger('jabatan_id');
            $table->foreign('jabatan_id')->references('jabatan_id')->on('jabatans');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('pagawais');
    }
};
