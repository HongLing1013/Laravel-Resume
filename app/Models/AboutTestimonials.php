<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AboutTestimonials extends Model
{
    use HasFactory;

    protected $fillable = ['name' , 'job_title' , 'content' , 'image' ];

    public function aboutCategory(){
        return $this->belongsTo(AboutCategory::class , 'acid');
    }
}
