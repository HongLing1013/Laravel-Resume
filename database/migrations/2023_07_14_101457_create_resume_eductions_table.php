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
        Schema::create('resume_eductions', function (Blueprint $table) {
            $table->id();
            $table->foreignId('rcid')->constrained('resume_categories');
            $table->string('degree')->comment('程度');;
            $table->timestamp('year_from');
            $table->timestamp('year_to');
            $table->string('institution')->comment('機構');;
            $table->string('description')->comment('敘述');;
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('resume_eductions');
    }
};
