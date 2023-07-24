<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
    {
        DB::table('resume_experiences')->get()->each(function ($record) {
            DB::table('resume_experiences')
                ->where('id', $record->id)
                ->update([
                    'year_from' => new DateTime($record->year_from),
                    'year_to' => new DateTime($record->year_to)
                ]);
        });
    
        Schema::table('resume_experiences', function (Blueprint $table) {
            $table->dateTime('year_from')->nullable()->change();
            $table->dateTime('year_to')->nullable()->change();
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
            $table->string('year_from')->change();
            $table->string('year_to')->change();
        });
        
    }
};
