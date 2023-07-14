<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ResumeExperience extends Model
{
    use HasFactory;

    protected $fillable = [ 'rcid' , 'job_title' , 'year_from' , 'year_to' , 'company' , 'job_description' ];

    public function resumeCategory()
    {
        return $this->belongsTo(ResumeCategory::class , 'rcid');
    }
}
