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
        Schema::create('resume_sumaries', function (Blueprint $table) {
            $table->id();
            $table->foreignId('rcid')->constrained('resume_categories');
            $table->string('name');
            $table->string('address');
            $table->string('phone');
            $table->string('email');
            $table->string('summary');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('resume_sumaries');
    }
};
