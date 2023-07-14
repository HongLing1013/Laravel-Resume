<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ResumeCategory extends Model
{
    use HasFactory;

    protected $fillable = ['name'];

    public function resumeEduction()
    {
        return $this->hasMany(ResumeEduction::class , 'rcid');
    }

    public function resumeExperience()
    {
        return $this->hasMany(ResumeExperience::class , 'rcid');
    }

    public function resumeSumary()
    {
        return $this->hasMany(ResumeSumary::class , 'rcid');
    }
}
