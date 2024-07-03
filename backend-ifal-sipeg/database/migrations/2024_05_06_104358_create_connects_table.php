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
        Schema::create('connects', function (Blueprint $table) {
            $table->increments('connect_id');
            $table->unsignedInteger('user_id1');
            $table->foreign('user_id1')->references('user_id')->on('users');
            $table->unsignedInteger('user_id2');
            $table->foreign('user_id2')->references('user_id')->on('users');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('connects');
    }
};
