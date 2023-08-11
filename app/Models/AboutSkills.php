<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AboutSkills extends Model
{
    use HasFactory;

    protected $fillable = [ 'name' , 'degree' ];

    public function aboutCategory(){
        return $this->belongsTo(AboutCategory::class , 'acid');
    }
}
