<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AboutInterests extends Model
{
    use HasFactory;

    protected $fillable = ['name' , 'icon' , 'color'];

    function aboutCategory(){
        return $this->belongsTo(aboutCategory::class , 'acid');
    }
}
