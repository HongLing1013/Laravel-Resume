<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ResumeEduction extends Model
{
    use HasFactory;

    protected $fillable = [ 'rcid' , 'degree' , 'year_from' , 'year_to' , 'institution' , 'description' ];

    public function resumeCategory()
    {
        return $this->belongsTo(ResumeCategory::class , 'rcid');
    }
}
