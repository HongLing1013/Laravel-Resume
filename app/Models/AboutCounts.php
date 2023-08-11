<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AboutCounts extends Model
{
    use HasFactory;

    protected $fillable = ['name' , 'count' , 'icon'];

    public function aboutCategory(){
        return $this->belongsTo(AboutCategory::class , 'acid');
    }
}
