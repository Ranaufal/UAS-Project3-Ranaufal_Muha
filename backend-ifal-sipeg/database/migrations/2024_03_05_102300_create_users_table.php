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
        Schema::create('users', function (Blueprint $table) {
            $table->increments('user_id');
            $table->unsignedInteger('pegawai_id')->unique();
            $table->foreign('pegawai_id')->references('pegawai_id')->on('pegawais');
            $table->string('username', 15)->unique();
            $table->string('password');
            $table->integer('hak_akses');
            $table->text('url_profile')->nullable();
            $table->string('bio')->nullable();
            $table->timestamps();
            // $table->rememberToken();
            // $table->id();
            // $table->string('name');
            // $table->string('email')->unique();
            // $table->timestamp('email_verified_at')->nullable();
            // $table->string('password');
            // $table->rememberToken();
            // $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('users');
    }
};
