<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class ChangeYearFromAndYearToToStringInResumeExperiencesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('resume_experiences', function (Blueprint $table) {
            $table->string('year_from')->change();
            $table->string('year_to')->change();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('resume_experiences', function (Blueprint $table) {
            $table->dateTimeTz('year_from')->change();
            $table->dateTimeTz('year_to')->change();
        });
    }
    
}
