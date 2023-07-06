<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Portfolio extends Model
{
    use HasFactory;

    protected $fillable = [ 'pcid' , 'text' , 'image' , 'href' ];

    public function portfolioCategory()
    {
        return $this->belongsTo(PortfolioCategory::class , 'pcid');
    }
}
