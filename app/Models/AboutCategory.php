<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AboutCategory extends Model
{
    use HasFactory;

    protected $fillable = [ 'name' ];

    public function aboutAbout(){
        return $this->hasMany(AboutAbout::class , 'acid');
    }

    public function aboutCounts(){
        return $this->hasMany(AboutCounts::class , 'acid');
    }

    public function aboutSkills(){
        return $this->hasMany(AboutSkills::class , 'acid');
    }

    public function aboutInterests(){
        return $this->hasMany(AboutInterests::class , 'acid');
    }

    public function aboutTestimonials(){
        return $this->hasMany(AboutTestimonials::class , 'acid');
    }

}
