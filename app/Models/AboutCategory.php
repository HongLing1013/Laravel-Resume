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
}
