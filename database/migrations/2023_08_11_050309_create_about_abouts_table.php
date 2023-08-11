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
        Schema::create('about_abouts', function (Blueprint $table) {
            $table->id();
            $table->foreignId('acid')->constrained('about_categories');
            $table->string('title');
            $table->string('description');
            $table->timestamp('birthday');
            $table->string('website');
            $table->string('degree');
            $table->string('phone');
            $table->string('phemailone');
            $table->string('city');
            $table->string('freelance');
            $table->string('details');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('about_abouts');
    }
};
