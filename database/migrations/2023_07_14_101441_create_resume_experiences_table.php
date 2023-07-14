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
        Schema::create('resume_experiences', function (Blueprint $table) {
            $table->id();
            $table->foreignId('rcid')->constrained('resume_categories');
            $table->string('job_title')->comment('職稱');;
            $table->timestamp('year_from');
            $table->timestamp('year_to');
            $table->string('company')->comment('公司');;
            $table->string('job_description')->comment('工作敘述');;
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('resume_experiences');
    }
};
