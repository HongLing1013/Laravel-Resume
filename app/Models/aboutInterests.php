<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class aboutInterests extends Model
{
    use HasFactory;

    protected $fillable = ['name' , 'icon' , 'color'];

    function aboutCategory(){
        return $this->belongsTo(aboutCategory::class , 'acid');
    }
}
