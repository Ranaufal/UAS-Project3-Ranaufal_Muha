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
        Schema::create('cutis', function (Blueprint $table) {
            $table->increments('cuti_id');
            $table->unsignedInteger('pegawai_id');
            $table->foreign('pegawai_id')->references('pegawai_id')->on('pegawais');
            $table->string('detail_cuti', 50);
            $table->date('tgl_mulai');
            $table->date('tgl_selesai');
            $table->boolean('status_cuti')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('cutis');
    }
};
