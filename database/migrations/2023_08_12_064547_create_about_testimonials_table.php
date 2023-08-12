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
        Schema::create('about_testimonials', function (Blueprint $table) {
            $table->id();
            $table->foreignId('acid')->constrained('about_categories');
            $table->string('name');
            $table->string('job_title')->comment('職稱');
            $table->string('image');
            $table->string('content');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('about_testimonials');
    }
};
