<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ResumeSumary extends Model
{
    use HasFactory;

    protected $fillable = [ 'rcid' , 'name' , 'address' , 'phone' , 'email' , 'summary' ];

    public function resumeCategory()
    {
        return $this->belongsTo(ResumeCategory::class , 'rcid');
    }
}
