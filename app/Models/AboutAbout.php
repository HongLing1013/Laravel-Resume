<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AboutAbout extends Model
{
    use HasFactory;

    protected $fillable = [ 'title', 'description', 'birthday', 'website', 'degree',
                            'phone', 'phemailone', 'city', 'freelance', 'details' ];

    public function aboutCategory(){
        return $this->belongsTo(AboutCategory::class , 'acid');
    }

    public function aboutSkills(){
        return $this->belongsTo(AboutSkills::class , 'acid');
    }
}
